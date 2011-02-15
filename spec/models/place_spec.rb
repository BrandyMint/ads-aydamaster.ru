require 'spec_helper'

describe Place do
  it "should have ready, active, paused, archived states defined" do
    Place.state_machine.states.by_priority.collect{|s| s.name}.should == [:ready, :active, :paused, :archived]
  end

  it "should have [:activate, :reactivate, :pause, :archive, :release] state events defined" do
    Place.state_machine.events.collect{|e| e.name}.should ==
      [:activate, :reactivate, :pause, :archive, :release]
  end

  context "state callbacks" do
    it "should activate campaigns on reactivate" do
      p = Place.new(:state => "paused")
      campaign = stub("campaign", :can_activate? => true)

      p.should_receive(:campaigns){ [campaign] }
      campaign.should_receive(:activate){ true }

      transition = StateMachine::Transition.new(p, Place.state_machine, :reactivate, :paused, :active)
      transition.run_callbacks
    end

    it "should release campaigns on pause" do
      p = Place.new(:state => "active")
      campaign = stub("campaign", :can_release? => true)

      p.should_receive(:campaigns){ [campaign] }
      campaign.should_receive(:release){ true }

      transition = StateMachine::Transition.new(p, Place.state_machine, :pause, :active, :paused)
      transition.run_callbacks
    end

    it "should archive campaigns on archive" do
      p = Place.new(:state => "active")
      campaign = stub("campaign")

      p.should_receive(:campaigns){ [campaign] }
      campaign.should_receive(:archive){ true }

      transition = StateMachine::Transition.new(p, Place.state_machine, :archive, :active, :archived)
      transition.run_callbacks
    end

    it "should activate if active_campaigns_count > 1 on release" do
      p = Place.new(:active_campaigns_count => 2)
      p.should_receive(:activate)

      transition = StateMachine::Transition.new(p, Place.state_machine, :release, :active, :ready)
      transition.run_callbacks
    end
  end
end


# == Schema Information
#
# Table name: places
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  website_id :integer
#  format_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  state      :string(255)     not null
#  domains    :text
#  user_id    :integer         not null
#


require 'spec_helper'

describe Campaign do
  CURRENT_TIME = Time.now

  it "should have ready, active, paused, archived states defined" do
    Campaign.state_machine.states.by_priority.collect{|s| s.name}.should == [:ready, :active, :paused, :archived]
  end

  it "should have [:activate, :reactivate, :pause, :archive, :release] state events defined" do
    Campaign.state_machine.events.collect{|e| e.name}.should ==
      [:activate, :reactivate, :pause, :archive, :release]
  end

  context "state transition callbacks" do
    before(:all) do
      @campaign = Campaign.new({})
      @campaign.place = Place.new
    end

    it "updates started_at field on activate" do
      Time.stub(:now){ CURRENT_TIME }
      @campaign.place.stub(:increment!)

      @campaign.should_receive(:update_attribute).with(:started_at, CURRENT_TIME)

      t = StateMachine::Transition.new(@campaign, Campaign.state_machine, :activate, :ready, :active)
      t.run_callbacks
    end

    it "activates place if it can be activated on reactivate" do
      @campaign.state = "paused"
      @campaign.place.stub(:increment!)

      @campaign.place.should_receive(:can_activate?){ true }
      @campaign.place.should_receive(:activate)

      t = StateMachine::Transition.new(@campaign, Campaign.state_machine, :reactivate, :paused, :active)
      t.run_callbacks
    end

    it "pauses campaign if place cannot be activated on reactivate" do
      @campaign.state = "paused"
      @campaign.place.stub(:increment!)

      @campaign.place.should_receive(:can_activate?){ false }
      @campaign.should_receive(:pause)

      t = StateMachine::Transition.new(@campaign, Campaign.state_machine, :reactivate, :paused, :active)
      t.run_callbacks
    end

    it "sets stopped_at and releases place on archive" do
      Time.stub(:now){ CURRENT_TIME }
      @campaign.should_receive(:update_attribute).with(:stopped_at, CURRENT_TIME)
      @campaign.place.should_receive(:release)

      t = StateMachine::Transition.new(@campaign, Campaign.state_machine, :archive, :ready, :archived)
      t.run_callbacks
    end

    it "increments place.active_campaigns_count on any to :active transition" do
      @campaign.stub(:started_at){ CURRENT_TIME }
      @campaign.place.should_receive(:increment!)

      t = StateMachine::Transition.new(@campaign, Campaign.state_machine, :activate, :ready, :active)
      t.run_callbacks
    end

    it "decrements place.active_campaigns_count on :active to any transition" do
      @campaign.place.stub(:release)
      @campaign.place.should_receive(:decrement!)

      t = StateMachine::Transition.new(@campaign, Campaign.state_machine, :release, :active, :ready)
      t.run_callbacks
    end
  end
end



# == Schema Information
#
# Table name: campaigns
#
#  id              :integer         not null, primary key
#  place_id        :integer         not null
#  banner_id       :integer         not null
#  state           :string(255)     not null
#  start_date      :date            not null
#  stop_date       :date
#  start_time      :time            default(Sat Jan 01 00:00:00 UTC 2000), not null
#  stop_time       :time            default(Sat Jan 01 23:59:00 UTC 2000), not null
#  created_at      :datetime
#  updated_at      :datetime
#  user_id         :integer         not null
#  last_viewed_at  :datetime        default(Thu Feb 10 07:34:26 UTC 2011), not null
#  started_at      :datetime
#  stopped_at      :datetime
#  clicks_count    :integer         default(0)
#  clicks_limit    :integer         default(0)
#  views_count     :integer         default(0)
#  views_limit     :integer         default(0)
#  last_clicked_at :datetime
#


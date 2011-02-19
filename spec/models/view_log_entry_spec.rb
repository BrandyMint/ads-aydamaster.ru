require 'spec_helper'

describe ViewLogEntry do
  describe ".summarize_counters" do
    before(:each) do
      @start_time = Stat.truncated_time
      ViewLogEntry.create(:place_id => 1, :banner_id => 1, :campaign_id => 1, :created_at => @start_time - 1.seconds)
      ViewLogEntry.create(:place_id => 1, :banner_id => 1, :campaign_id => 1, :created_at => @start_time + 5.minutes)
      ViewLogEntry.create(:place_id => 1, :banner_id => 1, :campaign_id => 1, :created_at => @start_time + 7.minutes)
      @end_time = @start_time + 15.minutes
    end

    it "creates new stat record if it does not exist" do
      Stat.should_receive(:create){ true }
      ViewLogEntry.summarize_counters(@end_time, 15.minutes, @start_time).should == 2
    end

    it "updates stat record if it does exist" do
      stat_record = stub("stat")
      Stat.stub(:where){ stub("stat record", :first => stat_record) }
      stat_record.should_receive(:increment!).with("views_count", 2){ }

      ViewLogEntry.summarize_counters(@end_time, 15.minutes, @start_time).should == 2
    end
  end
end

# == Schema Information
#
# Table name: view_log_entries
#
#  id           :integer         not null, primary key
#  campaign_id  :integer
#  created_at   :datetime
#  request_dump :text
#  place_id     :integer
#  banner_id    :integer
#


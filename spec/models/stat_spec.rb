# -*- coding: utf-8 -*-
require 'spec_helper'

describe Stat do

  subject{ Stat }
  # Интервал 15 минут = 900 секунд

  it "время нормально превращается" do
    now = Time.now
    Time.local(*now.to_a).to_i.should == now.to_i
  end
  
  it "должен обрезать время по нижнему краю" do
    Timecop.freeze Time.parse('10/10/10 00:12:01') do
      subject.truncated_time.should == Time.parse('10/10/10 00:00:00')
    end
  end

  it "должен обрезать время по нижнему краю" do
    Timecop.freeze Time.parse('10/10/10 00:15:01') do
      subject.truncated_time.should == Time.parse('10/10/10 00:15:00')
    end
  end

  it "должен обрезать время по нижнему краю" do
    Timecop.freeze Time.parse('10/10/10 00:30:00') do
      subject.truncated_time.should == Time.parse('10/10/10 00:30:00')
    end
  end

  it "должен обрезать время по нижнему краю" do
    Timecop.freeze Time.parse('10/10/10 00:00:00') do
      subject.truncated_time.should == Time.parse('10/10/10 00:00:00')
    end
  end

  describe ".summarize_all" do
    it "calls summarize_counters on ViewLogEntry and ClickLogEntry" do
      ViewLogEntry.should_receive(:summarize_counters){ 10 }
      ClickLogEntry.should_receive(:summarize_counters){ 2 }
      Stat.summarize_all
    end
  end

  describe "#update_campaign" do
    it "updates banner and campaign stats" do
      stat = Stat.new(:views_count => 10, :clicks_count => 3)
      campaign = stub("campaign")
      banner = stub("banner")

      stat.stub(:campaign){ campaign }
      stat.stub(:banner){ banner}
      stat.stub(:changed_attributes){ {"views_count" => "4", "clicks_count" => "1"} }

      campaign.should_receive(:increment!).with(:views_count, 6)
      campaign.should_receive(:increment!).with(:clicks_count, 2)
      banner.should_receive(:increment!).with(:views_count, 6)
      banner.should_receive(:increment!).with(:clicks_count, 2)

      stat.update_campaign
    end
  end

end

# == Schema Information
#
# Table name: stats
#
#  id           :integer         not null, primary key
#  campaign_id  :integer
#  place_id     :integer
#  banner_id    :integer
#  date         :date
#  time         :time
#  clicks_count :integer         default(0)
#  views_count  :integer         default(0)
#  created_at   :datetime
#  updated_at   :datetime
#


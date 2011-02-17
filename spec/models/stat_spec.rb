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


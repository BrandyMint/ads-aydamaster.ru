# -*- coding: utf-8 -*-
class Stat < ActiveRecord::Base
  # combined_key = %w[place_id campaign_id banner_id date time]

  belongs_to :campaign
  belongs_to :banner
  belongs_to :place

  class << self

    def interval
      15.minutes
    end

    def truncated_time
      a = Time.now.to_a
      a[0]=0
      a[1]=a[1] - a[1] % (interval/60)
      Time.local *a
    end

    def summarize_all
      truncated_time = Stat.truncated_time;  seconds = Stat.interval
      summarized_at = Setting.counters_summarized_at
      print "Суммаризирую статистику начиная с #{summarized_at ? summarized_at.to_s(:short) : 'начала времен'} по #{truncated_time.to_s(:short)}"
      print "\nПросмотров: ", ViewLogEntry.summarize_counters( truncated_time, seconds, summarized_at )
      print "\nКликов: ", ClickLogEntry.summarize_counters( truncated_time, seconds, summarized_at )
      print "\n"
      Setting.counters_summarized_at = truncated_time
    end

  end

  after_save :update_campaign

  def update_campaign
    if campaign.present?
      campaign.increment! :views_count, views_count - changed_attributes["views_count"].to_i
      campaign.increment! :clicks_count, clicks_count - changed_attributes["clicks_count"].to_i
    end
    if banner.present?
      banner.increment! :views_count, views_count - changed_attributes["views_count"].to_i
      banner.increment! :clicks_count, clicks_count - changed_attributes["clicks_count"].to_i
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


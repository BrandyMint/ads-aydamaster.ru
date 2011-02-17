# -*- coding: utf-8 -*-
class Campaign < ActiveRecord::Base
  extend HasStates

  belongs_to :place
  belongs_to :banner
  belongs_to :user

  has_many :activity_log_entries, :as => :subject

  scope :active, where(:state=>'active')
  scope :live, where("state <> 'archived'")
  scope :expired, live.where("stop_date>current_date or (stop_date=current_date and stop_time>=current_time)")
  scope :ready_to_start, where("state='ready' and (start_date>current_date or (start_date=current_date and start_time>=current_time))")

  validates_presence_of :place, :banner, :start_date, :user

  after_save :check_limits


  has_states do
    after_transition :on => :activate do |campaign|
      campaign.update_attribute(:started_at, Time.now) unless campaign.started_at
    end

    after_transition :on => :reactivate do |campaign|
      if campaign.place.can_activate?
        campaign.place.activate
      else
        campaign.pause
      end
    end

    after_transition :on => :archive do |campaign|
      campaign.update_attribute(:stopped_at, Time.now)
      campaign.place.release
    end

    after_transition :active => any do |campaign|
      campaign.place.release
      campaign.place.decrement! :active_campaigns_count
    end

    after_transition any => :active do | campaign|
      campaign.place.increment! :active_campaigns_count
    end
  end


  def self.new(attributes = nil)
    attributes[:start_date] = Date.today
    attributes[:last_viewed_at] = Time.now
    super attributes
  end

  def limits_exceed?
    (clicks_limit and clicks_count>=clicks_limit) or (views_limit and views_count>=views_limit)
  end

  private

  def check_limits
    archive if limits_exceed?
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


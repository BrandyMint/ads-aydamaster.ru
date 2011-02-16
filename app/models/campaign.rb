# -*- coding: utf-8 -*-
class Campaign < ActiveRecord::Base
  extend HasStates

  belongs_to :place
  belongs_to :banner
  belongs_to :user

  has_many :activity_log_entries, :as => :subject

  scope :active, where(:state=>'active')
  scope :live, where("state <> 'archived'")

  validates_presence_of :place, :banner, :start_date, :user

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
      campaign.place.increment! :active_campaigns_count
    end

    after_transition any => :active do | campaign|
      campaign.place.decrement! :active_campaigns_count
    end
  end

  def self.new(attributes = nil)
    attributes[:start_date] = Date.today
    attributes[:last_viewed_at] = Time.now
    super attributes
  end

end

# == Schema Information
#
# Table name: campaigns
#
#  id             :integer         not null, primary key
#  place_id       :integer         not null
#  banner_id      :integer         not null
#  state          :string(255)     not null
#  start_date     :date            not null
#  stop_date      :date
#  start_time     :time            default(Sat Jan 01 00:00:00 UTC 2000), not null
#  stop_time      :time            default(Sat Jan 01 23:59:00 UTC 2000), not null
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer         not null
#  last_viewed_at :datetime        default(Thu Feb 10 07:34:26 UTC 2011), not null
#


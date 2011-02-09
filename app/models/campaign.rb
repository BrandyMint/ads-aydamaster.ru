# -*- coding: utf-8 -*-
class Campaign < ActiveRecord::Base
  extend HasStates

  belongs_to :place
  belongs_to :banner
  belongs_to :user

  validates_presence_of :place, :banner, :start_date, :user

  has_states

  def self.new(attributes = nil)
    attributes[:start_date] = Date.today
    super attributes
  end

end

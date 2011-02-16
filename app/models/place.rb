# -*- coding: utf-8 -*-
require 'format'

class Place < ActiveRecord::Base
  extend HasStates

  belongs_to :website #, :dependent => :destroy
  belongs_to :format  #, :dependent => :destroy
  belongs_to :user

  has_many :campaigns
  has_many :activity_log_entries, :as => :subject
  has_many :banners, :through => :campaigns

  validates_presence_of :format, :user
  # validates_uniqueness_of :name, :scope=>:website_id, :allow_nil=>true, :allow_blank=>true

  default_scope order( :created_at )

  has_states do
    after_transition :on => :reactivate do |place|
      place.campaigns.each do |campaign|
        campaign.activate if campaign.can_activate?
      end
    end

    after_transition :on => :pause do |place|
      place.campaigns.each do |campaign|
        campaign.release if campaign.can_release?
      end
    end

    after_transition :on => :archive do |place|
      place.campaigns.each do |campaign|
        campaign.archive
      end
    end

    after_transition :on => :release do |place|
      # Тут есть неявная связь с моделью Campaign, именно из нее вызывается place.release и
      # имеено оттуда инициируется уменьшение place.active_campaigns_count после вызова place.release
      unless place.active_campaigns_count == 1
        place.activate
      end
    end
  end

  # Можно геометрию задавать просто текстом: 200x200
  def geometry=(geometry)
    self.format = Format.find_by_width_and_height( *geometry.split('x') ) ||
      fail( "No such style: #{format}" )
  end

  def to_s
    name || "#{id} #{format}"
    #"#{name} #{format}"
  end

  alias_method :to_label, :to_s

  def uid
    id
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


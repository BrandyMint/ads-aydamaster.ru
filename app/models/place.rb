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

  has_states

  # Можно геометрию задавать просто текстом: 200x200
  def geometry=(geometry)
    self.format = Format.find_by_width_and_height( *geometry.split('x') ) ||
      fail( "No such style: #{format}" )
  end

  def to_s
    name
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
#


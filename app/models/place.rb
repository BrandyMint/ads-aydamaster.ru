# -*- coding: utf-8 -*-
require 'ad_style'

class Place < ActiveRecord::Base

  belongs_to :website, :dependent => :destroy
  belongs_to :ad_style, :dependent => :destroy

  has_many :campaigns


  validates_presence_of :ad_style, :website_id, :name

  validates_uniqueness_of :name, :scope=>:website_id

  default_scope order( :name )

  # https://github.com/rubyist/aasm
  include AASM

  aasm_column :state
  aasm_initial_state :ready
  
  aasm_state :ready      # Площадка включена, но на ней ничего нет
  aasm_state :paused     # Площадка временно выключена
  aasm_state :active     # На площадке висят баннера
  aasm_state :archive    # Площадка удалена
  
  def geometry=(geometry)
    self.ad_style = AdStyle.find_by_width_and_height( *geometry.split('x') ) || fail( "No such style: #{geometry}" )
  end

  def to_s
    name
  end

  def uid   # TODO
    id
  end
  
end

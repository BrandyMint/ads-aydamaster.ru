# -*- coding: utf-8 -*-
require 'format'

class Place < ActiveRecord::Base

  belongs_to :website, :dependent => :destroy
  belongs_to :format, :dependent => :destroy

  has_many :campaigns

  validates_presence_of :format
  validates_uniqueness_of :name, :scope=>:website_id, :allow_nil=>true, :allow_blank=>true

  default_scope order( :name )


  state_machine :state, :initial=>:ready 
  # aasm_state :ready      # Площадка включена, но на ней ничего нет
  # aasm_state :paused     # Площадка временно выключена
  # aasm_state :active     # На площадке висят баннера
  # aasm_state :archive    # Площадка удалена

  # Можно геометрию задавать просто текстом: 200x200
  def geometry=(geometry)
    self.format = Format.find_by_width_and_height( *geometry.split('x') ) ||
      fail( "No such style: #{format}" )
  end

  def to_s
    "#{name} #{format}"
  end

  alias_method :to_label, :to_s

  def uid
    id
  end

end

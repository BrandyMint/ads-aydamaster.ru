# -*- coding: utf-8 -*-
require 'geometry'

class Place < ActiveRecord::Base

  belongs_to :website, :dependent => :destroy
  belongs_to :geometry, :dependent => :destroy

  has_many :campaigns

  validates_presence_of :geometry, :website_id, :name
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

  # Можно геометрию задавать просто текстом: 200x200
  def geometry=(geometry)
    geometry = Geometry.find_by_width_and_height( *geometry.split('x') ) ||
      fail( "No such style: #{geometry}" ) if geometry.is_a? String
    self.geometry_id = geometry.present? ? geometry.id : nil
  end

  def to_s
    name
  end

  # TODO Сделать генерацию непоследовательного uid,
  # по нему на место ссылаются с сайтов
  def uid
    id
  end
  
end

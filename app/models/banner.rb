# -*- coding: utf-8 -*-
class Banner < ActiveRecord::Base
  belongs_to :user
  belongs_to :geometry

  has_many :campaigns

  scope :ready, where(:state=>:ready)

  validates_presence_of :user, :link #, :banner_file_name

  has_attached_file :banner, :styles => { :thumb => ["120x60>", :png] }
  validates_attachment_presence :banner
  validates_attachment_size :banner, :less_than => 500.kilobytes

  # TODO add flash
  validates_attachment_content_type :banner, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  include AASM
  
  aasm_column :state
  
  aasm_initial_state :ready
  
  aasm_state :active         # Используется в кампания
  aasm_state :ready          # Готов к использованию, не используется
  aasm_state :paused         # Времено отключен
  aasm_state :archive        # Удален, в архиве


  before_save :set_geometry
  before_save :set_name

  # TODO Валидацию на размеры баннеры и формата места
  
  def set_geometry
    g = Paperclip::Geometry.from_file( banner.to_file )
    self.width, self.height = g.width, g.height
    self.geometry = Geometry.find_or_create_by_width_and_height( g.width, g.height )
  end

  def set_name
    self.name = banner.original_filename unless self.name?
  end

  def to_s
    "#{name} #{geometry}"
  end
  
  alias_method :to_label, :to_s

end

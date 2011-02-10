# -*- coding: utf-8 -*-
class Banner < ActiveRecord::Base
  extend HasStates

  belongs_to :user
  belongs_to :format

  has_many :campaigns
  has_many :activity_log_entries, :as => :subject

  scope :ready, where(:state=>:ready)

  validates_presence_of :user, :banner #, :link #, :banner_file_name

  has_attached_file :banner, :styles => { :thumb => ["120x60>", :png] }
  validates_attachment_presence :banner
  validates_attachment_size :banner, :less_than => 500.kilobytes

  # TODO add flash application/x-shockwave-flash
  validates_attachment_content_type :banner, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  has_states

  before_save :set_format
  before_save :set_name

  # TODO Валидацию на размеры баннеры и формата места

  def set_format
    g = Paperclip::Geometry.from_file( banner.to_file )
    self.width, self.height = g.width, g.height
    self.format = Format.find_or_create_by_width_and_height( g.width, g.height )
  end

  def set_name
    self.name = banner.original_filename unless self.name?
  end

  def to_s
    "#{name} #{format}"
  end

  alias_method :to_label, :to_s
end

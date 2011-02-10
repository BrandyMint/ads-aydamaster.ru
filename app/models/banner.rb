# -*- coding: utf-8 -*-
class Banner < ActiveRecord::Base
  extend HasStates

  belongs_to :user
  belongs_to :format

  has_many :campaigns
  has_many :activity_log_entries, :as => :subject

  scope :ready, where(:state=>:ready)

  validates_presence_of :user, :banner #, :link #, :banner_file_name

  has_attached_file :banner, :styles => {
    :thumb => ["120x60>", :png],
    :mini => ["80x40>", :png],
  }
  
  validates_attachment_presence :banner
  validates_attachment_size :banner, :less_than => 500.kilobytes
  validates_attachment_content_type :banner, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'application/x-shockwave-flash']
  validate do |banner|
    # Удаляем ошибочки создания :preview для флешек
    banner.errors.clear if is_flash?
  end

  has_states

  before_save :set_format
  before_save :set_name

  # TODO Валидацию на размеры баннеры и формата места

  def is_flash?
    banner_content_type=='application/x-shockwave-flash'
  end

  def set_format
    if is_flash?
      g = ImageSpec.new(banner.to_file )
    else
      g = Paperclip::Geometry.from_file( banner.to_file )
    end
    self.width, self.height = g.width, g.height
    self.format = Format.find_or_create_by_width_and_height( width, height )
  end

  def set_name
    self.name = banner.original_filename unless self.name?
  end

  def to_s
    "#{name} #{format}"
  end

  alias_method :to_label, :to_s
end

# == Schema Information
#
# Table name: banners
#
#  id                  :integer         not null, primary key
#  user_id             :integer         not null
#  name                :string(255)     not null
#  width               :integer         not null
#  height              :integer         not null
#  format_id           :integer
#  state               :string(255)     not null
#  link                :string(255)     default("")
#  created_at          :datetime
#  updated_at          :datetime
#  banner_file_name    :string(255)
#  banner_content_type :string(255)
#  banner_file_size    :integer
#  banner_updated_at   :datetime
#


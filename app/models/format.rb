class Format < ActiveRecord::Base
  has_many :places
  has_many :banners

  default_scope order('width, height')

  # validates_uniqueness_of :name

  def to_s
    "#{geometry} #{name}"
  end

  def geometry
    "#{width}x#{height}"
  end
  
  alias_method :to_label, :to_s

end

# == Schema Information
#
# Table name: formats
#
#  id         :integer         not null, primary key
#  width      :integer         not null
#  height     :integer         not null
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


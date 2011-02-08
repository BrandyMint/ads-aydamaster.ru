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

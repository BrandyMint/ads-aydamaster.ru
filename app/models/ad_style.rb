class AdStyle < ActiveRecord::Base
  has_many :places
  has_many :ads

  default_scope order('width, height')


  def to_s
    geometry     #name? ? "#{size} #{name}" : size
  end
  
  alias_method :to_label, :to_s


  def geometry
    "#{width}x#{height}"
  end

  
end

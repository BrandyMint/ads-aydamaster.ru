class Website < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :domain

  validates_uniqueness_of :domain, :scope => :user_id

  has_many :places

  def to_s
    domain
  end
end

class Website < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :domain

  validates_uniqueness_of :domain, :scope => :user_id

  has_many :places

  def to_s
    domain
  end
end

# == Schema Information
#
# Table name: websites
#
#  id         :integer         not null, primary key
#  domain     :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#


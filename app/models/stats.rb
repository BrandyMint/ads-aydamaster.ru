class Stats < ActiveRecord::Base
end

# == Schema Information
#
# Table name: stats
#
#  id           :integer         not null, primary key
#  campaign_id  :integer
#  place_id     :integer
#  banner_id    :integer
#  date         :date
#  time         :time
#  clicks_count :integer         default(0)
#  views_count  :integer         default(0)
#  created_at   :datetime
#  updated_at   :datetime
#


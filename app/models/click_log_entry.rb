class ClickLogEntry < ActiveRecord::Base
end

# == Schema Information
#
# Table name: click_log_entries
#
#  id           :integer         not null, primary key
#  campaign_id  :integer
#  link         :string(255)
#  request_dump :text
#  created_at   :datetime
#  place_id     :integer
#  banner_id    :integer
#


class ViewLogEntry < ActiveRecord::Base
  extend CounterSummator
end

# == Schema Information
#
# Table name: view_log_entries
#
#  id           :integer         not null, primary key
#  campaign_id  :integer
#  created_at   :datetime
#  request_dump :text
#  place_id     :integer
#  banner_id    :integer
#


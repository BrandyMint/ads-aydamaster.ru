require 'spec_helper'

describe ClickLogEntry do
  pending "add some examples to (or delete) #{__FILE__}"
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


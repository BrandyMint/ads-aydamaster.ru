require 'spec_helper'

describe ActivityLogEntry do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: activity_log_entries
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  subject_id   :integer
#  subject_type :string(255)
#  action       :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#


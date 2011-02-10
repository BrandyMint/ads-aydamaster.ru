class ActivityLogEntry < ActiveRecord::Base
  belongs_to :subject, :polymorphic => true
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


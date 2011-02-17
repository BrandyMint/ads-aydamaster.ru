require 'spec_helper'

describe Banner do
  pending "add some examples to (or delete) #{__FILE__}"
end


# == Schema Information
#
# Table name: banners
#
#  id                  :integer         not null, primary key
#  user_id             :integer         not null
#  name                :string(255)     not null
#  width               :integer         not null
#  height              :integer         not null
#  format_id           :integer
#  state               :string(255)     not null
#  link                :string(255)     default("")
#  created_at          :datetime
#  updated_at          :datetime
#  banner_file_name    :string(255)
#  banner_content_type :string(255)
#  banner_file_size    :integer
#  banner_updated_at   :datetime
#  click_count         :integer         default(0)
#  view_count          :integer         default(0)
#  last_viewed_at      :datetime
#  last_clicked_at     :datetime
#


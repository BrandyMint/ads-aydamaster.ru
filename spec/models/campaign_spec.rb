require 'spec_helper'

describe Campaign do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: campaigns
#
#  id             :integer         not null, primary key
#  place_id       :integer         not null
#  banner_id      :integer         not null
#  state          :string(255)     not null
#  start_date     :date            not null
#  stop_date      :date
#  start_time     :time            default(Sat Jan 01 00:00:00 UTC 2000), not null
#  stop_time      :time            default(Sat Jan 01 23:59:00 UTC 2000), not null
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer         not null
#  last_viewed_at :datetime        default(Thu Feb 10 07:34:26 UTC 2011), not null
#


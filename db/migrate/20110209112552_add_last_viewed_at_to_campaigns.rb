class AddLastViewedAtToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :last_viewed_at, :datetime, :null => false
  end

  def self.down
    remove_column :campaigns, :last_viewed_at
  end
end

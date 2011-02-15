class AddStartStopTimestampsToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :started_at, :datetime, :default => nil
    add_column :campaigns, :stopped_at, :datetime, :default => nil
  end

  def self.down
    remove_column :campaigns, :started_at
    remove_column :campaigns, :stopped_at
  end
end

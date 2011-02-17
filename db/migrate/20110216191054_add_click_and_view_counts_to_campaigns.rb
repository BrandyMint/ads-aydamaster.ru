class AddClickAndViewCountsToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :clicks_count, :integer, :default => 0
    add_column :campaigns, :clicks_limit, :integer, :default => 0
    add_column :campaigns, :views_count, :integer, :default => 0
    add_column :campaigns, :views_limit, :integer, :default => 0

    Campaign.update_all(
      :clicks_count => 0,
      :clicks_limit => 0,
      :views_count => 0,
      :views_limit => 0
    )
  end

  def self.down
    remove_column :campaigns, :views_limit
    remove_column :campaigns, :views_count
    remove_column :campaigns, :click_limit
    remove_column :campaigns, :clicks_count
  end
end

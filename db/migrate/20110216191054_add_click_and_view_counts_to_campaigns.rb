class AddClickAndViewCountsToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :click_count, :integer, :default => 0
    add_column :campaigns, :max_click_count, :integer, :default => 0
    add_column :campaigns, :view_count, :integer, :default => 0
    add_column :campaigns, :max_view_count, :integer, :default => 0

    Campaign.update_all(
      :click_count => 0,
      :max_click_count => 0,
      :view_count => 0,
      :max_view_count => 0
    )
  end

  def self.down
    remove_column :campaigns, :max_view_count
    remove_column :campaigns, :view_count
    remove_column :campaigns, :max_click_count
    remove_column :campaigns, :click_count
  end
end

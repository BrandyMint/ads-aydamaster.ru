class AddActiveCampaignsCountToPlaces < ActiveRecord::Migration
  def self.up
    add_column :places, :active_campaigns_count, :integer, :default => 0
  end

  def self.down
    remove_column :places, :active_campaigns_count
  end
end

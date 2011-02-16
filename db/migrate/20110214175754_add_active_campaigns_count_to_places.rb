class AddActiveCampaignsCountToPlaces < ActiveRecord::Migration
  def self.up
    add_column :places, :active_campaigns_count, :integer, :default => 0, :null=>false
    Place.all.each do |place|
      if place.campaigns.active.present? 
        place.increment! :active_campaigns_count, place.campaigns.active.count
      end
    end
  end

  def self.down
    remove_column :places, :active_campaigns_count
  end
end

class AddInfoFieldsToBannersAndCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :last_clicked_at, :datetime
    add_column :banners, :click_count, :integer, :default => 0
    add_column :banners, :view_count, :integer, :default => 0
    add_column :banners, :last_viewed_at, :datetime
    add_column :banners, :last_clicked_at, :datetime

    Banner.update_all(:click_count => 0, :view_count => 0)
  end

  def self.down
    remove_column :banners, :last_clicked_at
    remove_column :banners, :last_viewed_at
    remove_column :banners, :view_count
    remove_column :banners, :view_count
    remove_column :campaigns, :last_clicked_at
  end
end

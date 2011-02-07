class AddUserIdToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :user_id, :integer, :null=>false
    rename_column :campaigns, :ad_id, :banner_id
  end

  def self.down
    remove_column :campaigns, :user_id
    rename_column :campaigns, :banner_id, :ad_id
  end
end

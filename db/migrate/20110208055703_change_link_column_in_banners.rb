class ChangeLinkColumnInBanners < ActiveRecord::Migration
  def self.up
    change_column :banners, :link, :string, :null=>true, :default=>''
    rename_column :banners, :geometry_id, :format_id
    rename_column :places, :geometry_id, :format_id
    add_column :places, :domains, :text
  end

  def self.down
    change_column :banners, :link, :string, :null=>false
    rename_column :banners, :format_id, :geometry_id
    rename_column :places, :format_id, :geometry_id
    remove_column :places, :domains, :text
  end
end

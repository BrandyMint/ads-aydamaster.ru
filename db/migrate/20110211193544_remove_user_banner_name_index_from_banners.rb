# -*- coding: undecided -*-
class RemoveUserBannerNameIndexFromBanners < ActiveRecord::Migration
  def self.up
    # Удаляем с индекса уникальность
    remove_index :banners, [:user_id, :name]
    add_index :banners, [:user_id, :name]
  end

  def self.down
    add_index :banners, [:user_id, :name]
  end
end

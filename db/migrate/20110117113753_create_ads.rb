class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.integer :user_id, :null=>false
      t.string :name, :null=>false
      t.integer :width, :null=>false
      t.integer :height, :null=>false
      t.integer :geometry_id
      t.string :state, :null=>false
      t.string :link, :null=>false

      t.timestamps
    end

    add_index :banners, [:user_id, :name], :unique=>true
  end

  def self.down
    drop_table :banners
  end
end

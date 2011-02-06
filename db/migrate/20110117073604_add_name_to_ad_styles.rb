class AddNameToAdStyles < ActiveRecord::Migration
  def self.up
    create_table :ad_styles do |t|
      t.integer :width, :null=>false
      t.integer :height, :null=>false
      t.string :name, :null=>false, :unique=>true
      t.timestamps
    end

    add_index :ad_styles, [:width, :height], :unique=>true
  end

  def self.down
    drop_table :ad_styles
  end
end

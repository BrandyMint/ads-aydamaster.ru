class AddNameToAdStyles < ActiveRecord::Migration
  def self.up
    create_table :geometries do |t|
      t.integer :width, :null=>false
      t.integer :height, :null=>false
      t.string :name, :null=>true, :unique=>true
      t.timestamps
    end

    add_index :geometries, [:width, :height], :unique=>true
  end

  def self.down
    drop_table :geometries
  end
end

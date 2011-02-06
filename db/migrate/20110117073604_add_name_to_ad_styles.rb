class AddNameToAdStyles < ActiveRecord::Migration
  def self.up
    add_column :ad_styles, :name, :string, :unique=>true, :null=>true

    add_index :ad_styles, [:width, :height], :unique=>true
  end

  def self.down
    remove_column :ad_styles, :name
  end
end

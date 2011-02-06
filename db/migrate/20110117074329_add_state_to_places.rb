class AddStateToPlaces < ActiveRecord::Migration
  def self.up
    add_column :places, :state, :string, :null=>false
  end

  def self.down
    remove_column :places, :state
  end
end

class AddIndexesToSharedPlaces < ActiveRecord::Migration
  def self.up
    add_index :shared_places, [:email, :place_id], :unique => true
    add_index :shared_places, [:guest_id, :place_id], :unique => true
  end

  def self.down
    remove_index :shared_places, :column => [:guest_id, :place_id]
    remove_index :shared_places, :column => [:email, :place_id]
  end
end

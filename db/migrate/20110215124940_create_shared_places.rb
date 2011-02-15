class CreateSharedPlaces < ActiveRecord::Migration
  def self.up
    create_table :shared_places do |t|
      t.integer :place_id
      t.integer :guest_id
      t.string  :email
      t.timestamps
    end
  end

  def self.down
    drop_table :shared_places
  end
end

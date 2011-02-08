class CreateStats < ActiveRecord::Migration
  def self.up
    create_table :stats do |t|
      t.integer :campaign_id
      t.integer :place_id
      t.integer :banner_id
      t.date :date
      t.time :time
      t.integer :clicks_count, :default => 0
      t.integer :views_count, :default => 0
      t.timestamps
    end

    add_index :stats, [:campaign_id, :place_id, :banner_id, :date, :time], :unique => true, :name => "by_all_ids"
  end

  def self.down
    drop_table :stats
  end
end

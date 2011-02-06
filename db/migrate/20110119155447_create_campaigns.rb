class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.integer :place_id, :null=>false
      t.integer :ad_id, :null=>false
      t.string :state, :null=>false
      t.date :start_date, :null=>false
      t.date :stop_date
      t.time :start_time, :null=>false, :default => '00:00'
      t.time :stop_time, :null=>false, :default => '23:59'

      t.timestamps
    end

    add_index :campaigns, [:place_id, :state]
    add_index :campaigns, [:ad_id, :state]
  end

  def self.down
    drop_table :campaigns
  end
end

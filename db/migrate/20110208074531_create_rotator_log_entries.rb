class CreateRotatorLogEntries < ActiveRecord::Migration
  def self.up
    create_table :rotator_log_entries do |t|
      t.integer :place_id
      t.integer :campaign_id
      t.integer :banner_id
      t.string  :ip, :length => 40
      t.string  :referrer
      t.timestamps
    end
  end

  def self.down
    drop_table :rotator_log_entries
  end
end

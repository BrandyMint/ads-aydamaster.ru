class CreateClickLogEntries < ActiveRecord::Migration
  def self.up
    create_table :click_log_entries do |t|
      t.integer :campaign_id
      t.string :link
      t.text :request_dump
      t.timestamps
    end
  end

  def self.down
    drop_table :click_log_entries
  end
end

class RemoveUpdatedAtFromLogs < ActiveRecord::Migration
  def self.up
    remove_column :click_log_entries, :updated_at
    remove_column :rotator_log_entries, :updated_at

    add_index :click_log_entries, :created_at
    add_index :rotator_log_entries, :created_at
  end

  def self.down
    add_column :click_log_entries, :updated_at, :timestamp
    add_column :rotator_log_entries, :updated_at, :timestamp
  end
end

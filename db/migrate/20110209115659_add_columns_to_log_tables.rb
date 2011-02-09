class AddColumnsToLogTables < ActiveRecord::Migration
  def self.up
    add_column :rotator_log_entries, :place_id, :integer
    add_column :rotator_log_entries, :banner_id, :integer
    add_column :click_log_entries, :place_id, :integer
    add_column :click_log_entries, :banner_id, :integer

  end

  def self.down
    remove_column :rotator_log_entries, :place_id
    remove_column :rotator_log_entries, :banner_id
    remove_column :click_log_entries, :place_id
    remove_column :click_log_entries, :banner_id
  end
end

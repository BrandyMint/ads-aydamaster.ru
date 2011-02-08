class ChangeRotatorLogEntries < ActiveRecord::Migration
  def self.up
    remove_column :rotator_log_entries, :ip
    remove_column :rotator_log_entries, :referrer
    remove_column :rotator_log_entries, :place_id
    remove_column :rotator_log_entries, :banner_id
    add_column :rotator_log_entries, :env_dump, :text
  end

  def self.down
    add_column :rotator_log_entries, :ip, :string, :length => 40
    add_column :rotator_log_entries, :referrer, :string
    add_column :rotator_log_entries, :place_id, :integer
    add_column :rotator_log_entries, :banner_id, :integer
    remove_column :rotator_log_entries, :env_dump
  end
end

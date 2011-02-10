class RenameRotatorLogEntryToViewLogEntry < ActiveRecord::Migration
  def self.up
    rename_table :rotator_log_entries, :view_log_entries
  end

  def self.down
    rename_table :view_log_entries, :rotator_log_entries
  end
end

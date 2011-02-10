class CreateActivityLogEntries < ActiveRecord::Migration
  def self.up
    create_table :activity_log_entries do |t|
      t.integer    :user_id
      t.references :subject, :polymorphic => true
      t.string     :action
      t.timestamps
    end
  end

  def self.down
    drop_table :activity_log_entries
  end
end

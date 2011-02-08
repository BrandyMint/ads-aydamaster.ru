class AddConfirmableToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :confirmation_token,   :string
    add_column :users, :confirmed_at,         :timestamp
    add_column :users, :confirmation_sent_at, :timestamp
    add_column :users, :authentication_token, :string

    add_index :users, :authentication_token, :unique=>true
    add_index :users, :confirmation_token, :unique=>true

  end

  def self.down
  end
end

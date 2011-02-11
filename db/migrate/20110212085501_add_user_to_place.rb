class AddUserToPlace < ActiveRecord::Migration
  def self.up
    add_column :places, :user_id, :integer
    Place.update_all(:user_id => User.first.id)
    change_column :places, :user_id, :integer, :null=>false
  end

  def self.down
    remove_column :places, :user_id
  end
end

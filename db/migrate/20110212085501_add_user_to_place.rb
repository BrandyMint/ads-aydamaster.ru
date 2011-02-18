class AddUserToPlace < ActiveRecord::Migration
  def self.up
    add_column :places, :user_id, :integer
    if user = User.first
      Place.update_all(:user_id => user.id)
    end
    change_column :places, :user_id, :integer, :null=>false
  end

  def self.down
    remove_column :places, :user_id
  end
end

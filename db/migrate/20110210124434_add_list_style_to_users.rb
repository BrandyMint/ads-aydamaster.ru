# -*- coding: undecided -*-
class AddListStyleToUsers < ActiveRecord::Migration
  def self.up
    # Стиль отображения списка баннеров list/images
    add_column :users, :list_style, :string, :null=>false, :default=>'list'
  end

  def self.down
    remove_column :users, :list_style
  end
end

class RenamUrlToDomainInWebsites < ActiveRecord::Migration
  def self.up
    rename_column :websites, :url, :domain
  end

  def self.down
    rename_column :websites, :domain, :url
  end
end

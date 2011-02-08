class RenameGeometryTableToFormatTable < ActiveRecord::Migration
  def self.up
    rename_table :geometries, :formats
  end

  def self.down
    rename_table :formats, :geometries
  end
end

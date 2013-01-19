class AddHiddenToPicturesAndAlbums < ActiveRecord::Migration
  def change
        add_column :pictures, :hidden, :boolean, :default => false, :not_null => true
        add_column :albums, :hidden, :boolean, :default => false, :not_null => true
  end
end

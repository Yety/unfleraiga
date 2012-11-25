class AddMustBeLoggedInToPicturesAndAlbums < ActiveRecord::Migration
  def change
        add_column :pictures, :must_be_logged_in_to_view, :boolean, :default => false, :not_null => true
        add_column :albums, :must_be_logged_in_to_view, :boolean, :default => false, :not_null => true
  end
end

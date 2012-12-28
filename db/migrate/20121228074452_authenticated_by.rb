class AuthenticatedBy < ActiveRecord::Migration
  def change
    add_column :users, :authenticated_by, :string, :default => "local"
  end
end

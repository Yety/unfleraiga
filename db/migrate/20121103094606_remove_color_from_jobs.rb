class RemoveColorFromJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :color
  end

  def down
    add_column :jobs, :color, :string
  end
end

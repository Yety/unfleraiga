class AddJenkinsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :jenkins, :string
  end
end

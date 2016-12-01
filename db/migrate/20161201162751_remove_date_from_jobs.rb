class RemoveDateFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :date, :string
  end
end

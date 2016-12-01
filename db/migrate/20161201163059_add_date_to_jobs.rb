class AddDateToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :date, :date
  end
end

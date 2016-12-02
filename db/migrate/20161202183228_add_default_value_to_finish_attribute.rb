class AddDefaultValueToFinishAttribute < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :finish, :boolean, :default => false
  end
end

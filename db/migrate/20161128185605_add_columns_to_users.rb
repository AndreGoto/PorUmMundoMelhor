class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :string
    add_column :users, :city, :string
    add_column :users, :picture, :string
    add_column :users, :about, :string
    add_column :users, :active, :boolean, :default => true
  end
end

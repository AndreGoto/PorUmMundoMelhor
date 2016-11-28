class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.text :description
      t.text :short_description
      t.string :category
      t.string :title
      t.boolean :remote
      t.boolean :finish
      t.string :address
      t.string :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

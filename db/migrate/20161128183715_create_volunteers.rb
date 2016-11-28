class CreateVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end

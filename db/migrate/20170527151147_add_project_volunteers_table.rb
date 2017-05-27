class AddProjectVolunteersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :project_volunteers do |t|
      t.integer :project_id
      t.integer :volunteer_id

      t.timestamps
    end
  end
end

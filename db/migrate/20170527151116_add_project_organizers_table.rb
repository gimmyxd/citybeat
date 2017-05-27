class AddProjectOrganizersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :project_organizers do |t|
      t.integer :project_id
      t.integer :organizer_id

      t.timestamps
    end
  end
end

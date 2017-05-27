class AddProjectTypesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :project_types do |t|
      t.integer :project_id
      t.integer :type_id

      t.timestamps
    end
  end
end

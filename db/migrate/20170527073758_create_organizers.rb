class CreateOrganizers < ActiveRecord::Migration[5.0]
  def change
    create_table :organizers do |t|
      t.string :name
      t.text :description
      t.integer :funds
      t.integer :project_id

      t.timestamps
    end
  end
end

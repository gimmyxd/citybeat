class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.text :keywords
      t.string :status
      t.integer :organizer_id
      t.integer :volunteer_id
      t.string :photo

      t.timestamps
    end
  end
end

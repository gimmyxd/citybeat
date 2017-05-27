class AddProjectToVolunteers < ActiveRecord::Migration[5.0]
  def change
    add_reference :volunteers, :project, foreign_key: true
  end
end

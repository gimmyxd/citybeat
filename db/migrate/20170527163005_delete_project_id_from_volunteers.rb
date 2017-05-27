class DeleteProjectIdFromVolunteers < ActiveRecord::Migration[5.0]
  def change
    remove_column :volunteers, :project_id, :integer
  end
end
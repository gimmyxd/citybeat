class DeleteProjectIdFromOrganizers < ActiveRecord::Migration[5.0]
  def change
    remove_column :organizers, :project_id, :integer
  end
end
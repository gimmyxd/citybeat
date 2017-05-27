class DeleteOrganizerIdFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :organizer_id, :integer
  end
end

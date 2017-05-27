class DeleteVolunteerIdFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :volunteer_id, :integer
  end
end
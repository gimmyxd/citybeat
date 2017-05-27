class DeleteCnpFromVolunteers < ActiveRecord::Migration[5.0]
  def change
    remove_column :volunteers, :cnp, :string
  end
end

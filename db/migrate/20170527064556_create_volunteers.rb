class CreateVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone_number
      t.integer :age
      t.string :cnp
      t.string :gender

      t.timestamps
    end
  end
end

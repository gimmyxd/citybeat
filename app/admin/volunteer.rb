ActiveAdmin.register Volunteer do
  actions :all, :except => [:new, :edit]
  permit_params :email, :firstname, :lastname, :phone_number, :age, :gender

  index do
    selectable_column
    id_column
    column :email
    column :firstname
    column :lastname
    column :phone_number
    column :age
    column :gender
    actions
  end

  filter :all

end

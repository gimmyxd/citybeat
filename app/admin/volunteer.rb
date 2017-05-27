ActiveAdmin.register Volunteer do
  actions :all
  permit_params :email, :firstname, :lastname, :phone_number, :age, :cnp, :gender

  index do
    selectable_column
    id_column
    column :email
    column :firstname
    column :lastname
    column :phone_number
    column :age
    column :cnp
    column :gender
    actions
  end

  filter :all

  form do |f|
    f.inputs "Volunteer" do
      f.input :email
      f.input :firstname
      f.input :lastname
      f.input :phone_number
      f.input :age
      f.input :cnp
      f.input :gender, as: :select, collection: [['Female', 'Female'], ['Male', 'Male']]
    end
    f.actions
  end

end

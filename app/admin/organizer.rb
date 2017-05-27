ActiveAdmin.register Organizer do
  actions :all
  permit_params :name, :description, :funds

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :funds
    actions
  end

  filter :all

  form do |f|
    f.inputs "Organizer" do
      f.input :name
      f.input :description, as: :text
      f.input :funds
    end
    f.actions
  end

end

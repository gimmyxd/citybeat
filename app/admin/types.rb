ActiveAdmin.register Type do
  actions :all
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :all

  form do |f|
    f.inputs "Types" do
      f.input :name
    end
    f.actions
  end

end

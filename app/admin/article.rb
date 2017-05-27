ActiveAdmin.register Article do
  actions :all
  permit_params :title, :url

  index do
    selectable_column
    id_column
    column :title
    column :url
    column :project
    actions
  end

  filter :all

  form do |f|
    f.inputs "Project" do
      f.input :title
      f.input :url
    end
    f.actions
  end

end

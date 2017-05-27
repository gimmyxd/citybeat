ActiveAdmin.register ProjectType do
  actions :all
  permit_params :project_id, :type_id

  index do
    selectable_column
    id_column
    column :project_id
    column :type_id
    actions
  end

  filter :all

  form do |f|
    f.inputs "Project type" do
      f.input :type_id
      f.input :project_id
    end
    f.actions
  end

end

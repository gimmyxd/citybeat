ActiveAdmin.register ProjectOrganizer do
  actions :all
  permit_params :project_id, :organizer_id

  index do
    selectable_column
    id_column
    column :project_id
    column :organizer_id
    actions
  end

  filter :all

  form do |f|
    f.inputs "Project Organizer" do
      f.input :organizer_id
      f.input :project_id
    end
    f.actions
  end

end

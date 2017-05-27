ActiveAdmin.register ProjectVolunteer do
  actions :all
  permit_params :project_id, :volunteer_id

  index do
    selectable_column
    id_column
    column :project_id
    column :volunteer_id
    actions
  end

  filter :all

  form do |f|
    f.inputs "Project Volunteer" do
      f.input :volunteer_id
      f.input :project_id
    end
    f.actions
  end

end

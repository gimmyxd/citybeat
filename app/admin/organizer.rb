ActiveAdmin.register Organizer do
  actions :all
  permit_params :name, :description, :funds, :project_id

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :funds
    column :project_id
    actions
  end

  filter :all

  form do |f|
    f.inputs "Organizer" do
      f.input :name
      f.input :description, as: :text
      f.input :funds
      f.input :project_id, as: :select, collection: Project.all.collect {|project| [project.title, project.id] }
    end
    f.actions
  end

end

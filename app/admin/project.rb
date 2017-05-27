ActiveAdmin.register Project do
  actions :all
  permit_params :title, :description, :keywords, :status, :organizer_id, :volunteer_id, :photo

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :keywords
    column :status
    column :organizer_id
    column :volunteer_id
    column :photo
    actions
  end

  filter :all

  form do |f|
    f.inputs "Project" do
      f.input :title
      f.input :description, as: :text
      f.input :keywords, as: :text
      f.input :status
      f.input :organizer_id, as: :select, collection: Organizer.all.collect {|organizer| [organizer.name, organizer.id] }
      f.input :volunteer_id, as: :select, collection: Volunteer.all.collect {|volunteer| [volunteer.firstname + ' ' + volunteer.lastname, volunteer.id] }
      f.input :photo
    end
    f.actions
  end

end

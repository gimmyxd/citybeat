ActiveAdmin.register Project do
  actions :all
  permit_params :title, :description, :keywords, :status, :photo

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :keywords
    column :status
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
      f.input :photo

      f.input :organizers, as: :select, collection: Organizer.all.pluck(:name, :id)
      f.input :volunteers, as: :select, collection: Volunteer.all.collect { |f| ["#{f.firstname} #{f.lastname}", f.id] }
      f.input :types, as: :select, collection: Type.all.pluck(:name, :id)

    end
    f.actions
  end

end

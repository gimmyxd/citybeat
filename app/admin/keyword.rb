ActiveAdmin.register Keyword do
  actions :all
  permit_params :keyword

  index do
    selectable_column
    id_column
    column :keyword
    actions
  end

  filter :all

  form do |f|
    f.inputs "Types" do
      f.input :keyword
    end
    f.actions
  end

end

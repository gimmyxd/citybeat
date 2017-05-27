ActiveAdmin.register RssFeed do
  actions :all
  permit_params :url, :last_parsed

  index do
    selectable_column
    id_column
    column :url
    actions
  end

  filter :all

  form do |f|
    f.inputs "RssFeed" do
      f.input :url
    end
    f.actions
  end

end

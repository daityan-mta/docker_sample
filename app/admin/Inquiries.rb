ActiveAdmin.register Inquiry do
  permit_params :genre, :name, :email, :inquiery

  index do
    selectable_column
    id_column
    column :genre
    column :name
    column :email
    column :inquiery
    actions
  end

  filter :genre
  filter :name
  filter :email
  filter :inquiery

  form do |f|
    f.inputs do
      f.input :genre
      f.input :name
      f.input :email
      f.input :inquiery
    end
    f.actions
  end

end

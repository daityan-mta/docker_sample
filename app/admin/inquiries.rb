ActiveAdmin.register Inquiry do
  permit_params :genre, :name, :email, :inquiery, :image

  index do
    selectable_column
    id_column
    column :genre
    column :name
    column :email
    column :inquiery
    column :image
    actions
  end

  filter :genre
  filter :name
  filter :email
  filter :inquiery
  filter :image

  form do |f|
    f.inputs do
      f.input :genre
      f.input :name
      f.input :email
      f.input :inquiery
      f.input :image
    end
    f.actions
  end
end

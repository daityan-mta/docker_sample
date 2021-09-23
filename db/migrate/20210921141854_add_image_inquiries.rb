class AddImageInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :image_id, :string
  end
end

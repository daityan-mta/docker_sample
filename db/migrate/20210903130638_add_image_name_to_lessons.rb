class AddImageNameToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :image_name, :string
  end
end

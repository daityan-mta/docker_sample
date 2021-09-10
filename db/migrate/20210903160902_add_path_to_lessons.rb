class AddPathToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :path, :string
  end
end

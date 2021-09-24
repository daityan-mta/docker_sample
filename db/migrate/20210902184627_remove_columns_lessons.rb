class RemoveColumnsLessons < ActiveRecord::Migration[5.2]
  def change
    # remove_column :lessons, :name, :string
    add_column :lessons, :genre, :string
  end
end

class AddLessonNameToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :introduce, :string
  end
end

class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :genre
      t.string :introduce
      t.string :image_name
      t.string :reference
      t.string :path
      t.string :reference_url
      t.timestamps
    end
  end
end

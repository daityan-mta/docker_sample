class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.string :content
      t.boolean :is_answer
      t.integer :question_id
      t.string :image_path
      t.integer :lesson_id
      t.timestamps
    end
  end
end

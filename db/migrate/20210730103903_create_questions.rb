class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :lesson_id
      t.integer :question_id
      t.timestamps
    end
  end
end

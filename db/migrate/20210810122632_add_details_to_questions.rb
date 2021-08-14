class AddDetailsToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :lesson_id, :integer
  end
end

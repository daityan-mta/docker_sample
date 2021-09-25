class ModifiedMigration < ActiveRecord::Migration[5.2]
  def change
    drop_table :helps
    drop_table :references
    drop_table :tops
    drop_table :user_lessons
  end
end

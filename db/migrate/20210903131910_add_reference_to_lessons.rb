class AddReferenceToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :reference, :string
  end
end

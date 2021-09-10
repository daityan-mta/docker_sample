class AddReferenceUrlToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :reference_url, :string
  end
end

class AddDetailsToChoices < ActiveRecord::Migration[5.2]
  def change
    add_column :choices, :image_path, :string
  end
end

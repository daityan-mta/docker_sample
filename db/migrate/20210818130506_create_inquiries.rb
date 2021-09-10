class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.integer :genre, null: false
      t.string :name
      t.string :email
      t.string :inquiery, null: false
      t.timestamps
    end
  end
end

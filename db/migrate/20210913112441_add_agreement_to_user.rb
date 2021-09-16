class AddAgreementToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :agreement, :boolean, null: false, default: false
  end
end

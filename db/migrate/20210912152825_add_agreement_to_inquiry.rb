class AddAgreementToInquiry < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :agreement, :boolean
  end
end

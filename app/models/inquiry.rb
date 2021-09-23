class Inquiry < ApplicationRecord
  attachment :image

  validates :genre, { presence: true }
  validates :inquiery, { presence: true }
end

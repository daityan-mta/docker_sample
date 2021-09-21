class Inquiry < ApplicationRecord
  validates :genre, { presence: true }
  validates :inquiery, { presence: true }
end

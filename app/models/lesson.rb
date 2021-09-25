class Lesson < ApplicationRecord
  has_many :questions, dependent: :nullify
end

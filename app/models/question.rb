class Question < ApplicationRecord
  belongs_to :lesson
  # belongs_to :user
  has_many :choices
  # has_many :answered_users, through: :answers, source: :user
end

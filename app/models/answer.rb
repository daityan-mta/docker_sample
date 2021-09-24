class Answer < ApplicationRecord
  belongs_to :user
  validates :question_id, uniqueness: { scope: :user_id }
end

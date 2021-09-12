class User < ApplicationRecord
  attachment :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  VALID_PASSWORD_REGIX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :name, presence: true, length: { maximum: 16}
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6}
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGIX}
end

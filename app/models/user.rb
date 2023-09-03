class User < ApplicationRecord

  has_many :articles

  validates :nickname, presence: true, uniqueness: true

  validates :nickname, presence: true, length: { minimum: 2, maximum: 20 }

  validates :nickname, format: { with: /\A[a-zA-Z\s-]+\z/,
    message: "only allows letters" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

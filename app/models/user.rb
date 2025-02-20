class User < ApplicationRecord
  has_secure_password
  has_many :borrowings, dependent: :destroy
  has_many :books, through: :borrowings

  validates :email, presence: true, uniqueness: true
end

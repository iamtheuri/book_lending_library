class Book < ApplicationRecord
  has_many :borrowings, dependent: :destroy
  has_many :users, through: :borrowings

  validates :title, :author, :isbn, presence: true
  validates :isbn, uniqueness: true
  validates :isbn, format: {
    with: /\A(?:\d{9}X|\d{10}|\d{13})\z/,
    message: "Must be a valid 10 or 13-digit International Standard Book Number"
  }

  # Check book availability
  def available?
    borrowings.where(returned: false).empty?
  end
end

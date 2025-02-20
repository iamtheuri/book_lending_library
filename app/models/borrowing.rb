class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :due_date, presence: true
  validate :book_availability, on: :create

  before_validation :set_due_date, on: :create

  scope :active, -> { where(returned: false) }

  private

  def set_due_date
    self.due_date ||= 2.weeks.from_now.to_date
  end

  def book_availability
    if book && book.borrowings.active.exists?
      errors.add(:book, "is already borrowed")
    end
  end
end

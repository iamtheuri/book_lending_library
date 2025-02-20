require "test_helper"

class BorrowingTest < ActiveSupport::TestCase
  include ActiveSupport::Testing::TimeHelpers

  def setup
    @user = User.create(email: "user@example.com", password: "password", password_confirmation: "password")
    @book = Book.create(title: "Example Book", author: "John Doe", isbn: "1234567890")
  end

  test "should create borrowing with due date set" do
    borrowing = Borrowing.new(user: @user, book: @book)
    assert borrowing.save, "Borrowing should save but did not: #{borrowing.errors.full_messages}"
    assert_equal 14, (borrowing.due_date - Date.today).to_i, "Expected due_date to be 14 days from now, but got #{borrowing.due_date}"
  end
end

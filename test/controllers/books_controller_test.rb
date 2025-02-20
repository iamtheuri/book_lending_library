require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @book = Book.create(title: "Example Book", author: "John Doe", isbn: "1234567890")
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end
end

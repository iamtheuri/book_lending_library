require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "validates presence of title, author, and isbn" do
    book = Book.new
    assert_not book.valid?
    assert_includes book.errors[:title], "can't be blank"
    assert_includes book.errors[:author], "can't be blank"
    assert_includes book.errors[:isbn], "can't be blank"
  end

  test "validates uniqueness of isbn" do
    book1 = Book.create(title: "Book One", author: "Author One", isbn: "9783161484100")
    book2 = Book.new(title: "Book Two", author: "Author Two", isbn: "9783161484100")
    assert_equal book1.isbn, book2.isbn
    assert_not book2.valid?
    assert_includes book2.errors[:isbn], "has already been taken"
  end

  test "valid ISBNs should be accepted" do
    valid_isbns = [ "123456789X", "0123456789", "9783161484100" ]

    valid_isbns.each do |isbn|
      book = Book.new(title: "Valid Book", author: "John Doe", isbn: isbn)
      assert book.valid?, "Expected ISBN #{isbn} to be valid"
    end
  end

  test "invalid ISBNs should be rejected" do
    invalid_isbns = [ "12345678", "ABCDEFGHJK", "123456789XX", "978316148410", "" ]
    invalid_isbns.each do |isbn|
      book = Book.new(title: "Invalid Book", author: "Jane Doe", isbn: isbn)
      assert_not book.valid?, "Expected ISBN #{isbn} to be invalid"
      assert_includes book.errors[:isbn], "Must be a valid 10 or 13-digit International Standard Book Number"
    end
  end
end

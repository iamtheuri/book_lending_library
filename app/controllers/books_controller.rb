class BooksController < ApplicationController
  before_action :require_login, only: [ :borrow ]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  # POST /books/:id/borrow
  def borrow
    @book = Book.find(params[:id])
    if @book.available?
      @borrowing = current_user.borrowings.new(book: @book)
      if @borrowing.save
        redirect_to user_path(current_user),
          notice: "Book borrowed successfully. Due on #{@borrowing.due_date}."
      else
        redirect_to book_path(@book), alert: "Could not borrow the book."
      end
    else
      redirect_to book_path(@book), alert: "Book is already borrowed."
    end
  end
end

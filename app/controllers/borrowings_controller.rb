class BorrowingsController < ApplicationController
  before_action :require_login

  # PATCH /borrowings/:id/return
  def return
    @borrowing = current_user.borrowings.find(params[:id])
    if @borrowing.update(returned: true)
      redirect_to user_path(current_user), notice: "Book returned successfully."
    else
      redirect_to user_path(current_user), alert: "Could not return the book."
    end
  end
end

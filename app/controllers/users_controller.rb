class UsersController < ApplicationController
  before_action :require_login, only: [ :show ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Registration successful!"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @borrowings = @user.borrowings.active.includes(:book)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

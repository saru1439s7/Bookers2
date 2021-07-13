class UsersController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = Book.all
  end

  def index
    @book_new = Book.new
    @user = current_user
    @book = Book.all
    @books = Book.all
    @users = User.all
  end


  def edit
    @user = User.find(params[:id])
  end

 def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit, notice: 'Name is too short (minimum is 2 characters)'
    end
 end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end

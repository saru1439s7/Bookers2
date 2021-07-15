class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = Book.all
   # @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end


  def edit
     @user = User.find(params[:id])
   unless @user == current_user
    redirect_to  user_path(current_user)
   end
  end
    #if user_signed_in?
      #@user = User.find(params[:id])
    #else
   #redirect_to user_path(current_user)
    #end
  #end
   #⑵if user == current_user
    #@user = User.find(params[:id])
   #else
    #render  :show
   #end
  #end
    #⑶@user = User.find(params[:id])
   #unless @user == current_user
      #redirect_to  edit_user_path
   #end
  #end

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
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

  def correct_user
   @user = User.find(params[:id])
   redirect_to(user_url(current_user)) unless @user == current_user
  end

end

class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end

  end
  
  def create
    @user = User.new(user_params)
    @users.save
    redirect_to user_path(@user.id)
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else 
      render :edit
    end 
    
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
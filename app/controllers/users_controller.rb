class UsersController < ApplicationController

  #new instantiates a new ActiveRecord model without saving it to the database  def new
  def new
    @user = User.new
  end

  #create immediately attempts to save it, as if you had called #new and then #save.
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = find_by_id(User)
    @recipes = @user.recipes 
    @comments = @user.comments
  end


  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

  
end

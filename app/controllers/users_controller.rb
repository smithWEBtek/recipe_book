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
    @user = current_user
    respond_to do |f|
      f.html
      f.json {render json: @user}
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

  
end

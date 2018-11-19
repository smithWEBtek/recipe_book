class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :find_by_id

  #find current user by session id
  def current_user
    User.find_by(id: session[:user_id])
  end
  
  #check if current user is logged in
  def logged_in?
   !!current_user
  end

  #using class name, find by params id
  def find_by_id(class_name)
    class_name.find_by(id: params[:id])
  end

 
end

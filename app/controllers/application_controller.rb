class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end
  
  def logged_in?
   !!current_user
 end

 def find_by_recipe_id
  Recipe.find_by(params[:recipe_id])
end

def own_recipes?
  if !!current_user.recipes
    redirect_to recipes_path
  end
end

def errors(method)
  object.errors.full_messages_for(method).map { |m| help_block(m) }.join.html_safe
end
end

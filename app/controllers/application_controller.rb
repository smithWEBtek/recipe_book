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
      Recipe.find_by(id: params[:recipe_id])
    end
  
end

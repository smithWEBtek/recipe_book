class SessionsController <ApplicationController

  #if oauth is present, login via oauth
  def create
    if auth.present?
        @user = User.from_omniauth(request.env["omniauth.auth"])
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "You have successfully logged in"
      end
    #if oauth is not present, find and validate user by name and password and go to users show 
    if params[:name].present?
      @user = User.find_by_name(params[:name])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "You have successfully logged in"
      else
       if @user
        flash[:alert] = "Your password is not correct"
      else 
        flash[:alert] = "The username is invalid"
      end
      render 'new'
    end
    else
      redirect_to '/login'
  end
end

  #auth method requesting credentials for google auth credentials
  def auth
    request.env['omniauth.auth']
  end

   def destroy
    session.destroy
    redirect_to '/', notice: "You have successfully logged out"
  end

end
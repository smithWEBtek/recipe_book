class SessionsController <ApplicationController

  def create
    if auth.present?
        @user = User.from_omniauth(request.env["omniauth.auth"])
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "You have successfully logged in"
      end
    
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
  end
end


  def auth
    request.env['omniauth.auth']
  end

   def destroy
    session.destroy
    redirect_to '/', notice: "You have successfully logged out"
  end

end
class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    username = params[:user][:email]
    password = params[:user][:password]

    user = User.find_by_credentials(username, password)

    if user 
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to users_url(user)
    else
      render json: user
    end 
    
  end

  def destroy
    # debugger 
    current_user.reset_session_token!
    session[:session_token] = nil
    curr_user = nil 
  end
end

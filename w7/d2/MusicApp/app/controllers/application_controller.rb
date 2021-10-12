class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  def current_user 
    users_token = session[:session_token]
    current_user = User.find_by(session_token: users_token)
    current_user
  end
  
  def logged_in? 
    user = User.find_by(session_token: session[:session_token])
    if !user.nil? 
      true 
    else
      false
    end
  end 

  def login(user)
    session[:session_token] = user.reset_session_token!
  end 
end

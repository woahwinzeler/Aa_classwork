class ApplicationController < ActionController::Base
  #CRLLL
  helper_method :logged_in?, :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    @current_user = user 
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
    current_user = nil 
    redirect_to users_url
  end 

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to users_url unless logged_in?
  end
end

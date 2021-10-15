class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(*user_credentials)
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ['Username or password is incorrect']
      render :new
    end
  end

  def destroy
    logout
  end

  private
  def user_credentials
    [ params[:user][:username], params[:user][:password] ]
  end
end

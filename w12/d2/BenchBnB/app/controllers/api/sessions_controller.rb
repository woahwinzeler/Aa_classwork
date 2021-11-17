class Api::SessionsController < ApplicationController
  
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if !@user.nil?
      login(@user)
      render json: @user
    else
      render @user.errors.full_messages, status: 422
    end
  end

  def destroy
    if current_user 
      logout
      render json: {}
    else
      render json: ['No User'], status: 404
    end
  end
end
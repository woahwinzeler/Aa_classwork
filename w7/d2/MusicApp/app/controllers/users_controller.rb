class UsersController < ApplicationController
  def new
    @user = User.new 
    render :new 
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to user_url(user)
    else
      flash[:errors] ||= []
      flash[:errors] << user.errors.full_messages
      redirect_to new_user_url 
    end
  end

  def show
    begin
      user = User.find(params[:id])
    rescue 
      flash[:errors] ||= []
      flash[:errors] << "Couldn't find user with the given ID"
      redirect_to new_user_url 
    else
      @user = user 
      render :show 
    end 
  end

  def index
    @users = User.all
    render :index 
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end

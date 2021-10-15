class UsersController < ApplicationController
  before_action :require_logged_in, except: [:index, :new, :create]

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id]) #nil or error ?
    if @user
      render :show
    else
      flash[:errors] = ["User not found"]
      redirect_to users_url
    end
  end

  def new
    @user = User.new
    render :new
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user
      render :edit
    else
      flash[:errors] = ["User not found"]
      redirect_to users_url
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      if @user == current_user
        logout(@user)
        @user.destroy
      else
        flash[:errors] = ["Cannot destroy users that aren't yourself"]
        redirect_to users_url
      end
    else
      flash[:errors] = ["User not found"]
      redirect_to users_url
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_url(user)
    else
      flash[:errors] = user.errors.full_messages 
      render :new 
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user
      if user.update(user_params)
        redirect_to user_url(user)
      else
        flash[:errors] = user.errors.full_messages 
        render :edit
      end 
    else
      flash[:errors] = ["User not found"]
      redirect_to users_url 
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    user = User.find_by(id: params[:id]) #nil or error ?
    @user = user
    if user
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
        #log_out(@user)
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
  end

  def update
  end

end

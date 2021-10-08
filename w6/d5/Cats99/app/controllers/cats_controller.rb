class CatsController < ApplicationController
  def index
    render :index 
  end

  def show
    @c = Cat.find_by(id: parmas[:id])
    render :show 
  end
end

class BandsController < ApplicationController
  def index
    @bands = Band.all 
    render :index
  end

  def create
    band = Band.new(band_params)
    if band.save
      redirect_to bands_url 
    else
      flash[:errors] ||= []
      flash[:errors] << user.errors.full_messages
      redirect_to bands_url 
    end 
  end

  def new
    @band = Band.new
    render :new 
  end

  def edit
    @band = Band.find(params[:id])
    render :edit 
  end

  def show
    begin
      band = Band.find(params[:id])
    rescue 
      flash[:errors] ||= []
      flash[:errors] << "Couldn't find the band with the given ID"
      redirect_to new_band_url 
    else
      @band = band 
      render :show 
    end 
  end

  def update
  end

  def destroy
  end

  private

  def band_params
    params.require(:band).permit(:name, :location)
  end
end

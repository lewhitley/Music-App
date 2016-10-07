class BandsController < ApplicationController
  before_action :require_user

  def index
    @bands = Band.all
    render :index
  end

  def new
  end

  def show
    @band = Band.find_by_id(params[:id])
    render :show
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def edit
    @band = Band.find_by_id(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band = Band.find_by_id(params[:id])
    @band.delete if @band
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end

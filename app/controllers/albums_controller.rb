class AlbumsController < ApplicationController
  before_action :require_user

  def new
  end

  def show
    @album = Album.find_by_id(params[:id])
    render :show
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_band_album_url(album_params[:band_id])
    end
  end

  def edit
  end

  def update
    @album = Album.find_by_id(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to edit_album_url
    end
  end

  def destroy
    @album = Album.find_by_id(params[:id])
    @album.delete if @album
    redirect_to band_url(@album.band_id)
  end

  private
  def album_params
    params.require(:album).permit(:title, :band_id, :recording)
  end
end

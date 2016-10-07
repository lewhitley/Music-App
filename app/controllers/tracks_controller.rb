class TracksController < ApplicationController
  before_action :require_user

  def new
  end

  def show
    @track = Track.find_by_id(params[:id])
    render :show
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to new_track_url
    end
  end

  def edit
    @track = Track.find_by_id(params[:id])
    render :edit
  end

  def update
    @track = Track.find_by_id(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to edit_track_url
    end
  end

  def destroy
    @track = Track.find_by_id(params[:id])
    @track.delete if @track
    redirect_to bands_url
  end

  private
  def track_params
    params.require(:track).permit(:song, :album_id, :track_type, :lyrics)
  end
end

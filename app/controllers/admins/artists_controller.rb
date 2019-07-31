class Admins::ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to admins_artists_path
    else
      @artists = Artist.all
      render :index
    end
  end

  def edit
    @artist = Artist.find(params[:id])
    @artists = Artist.all
    render :index
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to admins_artists_path
    else
      @artists = Artist.all
      render :index
    end
  end

  def destroy
    artist = Artist.find(parmas[:id])
    artist.destroy
    redirect_to admins_artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end

end

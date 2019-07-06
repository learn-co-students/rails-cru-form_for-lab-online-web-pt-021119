class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.create(params.require(:artist).permit(:name, :bio))
    redirect_to artist_path(@artist)
  end

  def update
    @artist = Artist.find(params[:id])
    @artist = Artist.update(params.require(:artist).permit(:name, :bio))
    redirect_to artist_path(@artist)
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_path
  end

end

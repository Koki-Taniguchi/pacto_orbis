class Admins::ArtistsController < ApplicationController
  def index

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end

end

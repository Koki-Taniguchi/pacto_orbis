class Admins::GenresController < ApplicationController
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

  def genre_params
    params.require(:genre).permit(:name)
  end
end

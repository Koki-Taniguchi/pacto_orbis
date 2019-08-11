class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @artists = Artist.all
    @labels = Label.all
    @genles = Genle.all
  end

  def edit

  end

  def update

  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:title, :price, :status, :stock, :jacket_image)
  end
end

class Admins::ItemsController < ApplicationController
  def index
    params[:search] ? @items = Item.search(params[:search]) : @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_item_path(item)
    else
      render new
    end
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

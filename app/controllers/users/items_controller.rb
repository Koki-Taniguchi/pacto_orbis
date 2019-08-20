class Users::ItemsController < Users::Base
  def index
    @items = Item.where(status: true).page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end
end

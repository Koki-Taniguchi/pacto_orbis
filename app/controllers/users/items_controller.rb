class Users::ItemsController < Users::Base
  def index
    @items = Item.where(status: true)
  end

  def show
    @item = Item.find(params[:id])
  end
end

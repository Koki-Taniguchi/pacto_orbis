class Users::ItemsController < Users::Base
  def index
    if params[:search].present?
      @items = Item.search(params[:search]).page(params[:page]).per(10)
    else
      @items = Item.page(params[:page]).per(10)
    end
  end

  def show
    @item = Item.find(params[:id])
  end
end

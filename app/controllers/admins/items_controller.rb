class Admins::ItemsController < Admins::Base
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @items = Item.search(params[:search]).page(params[:page]).per(10)
    else
      @items = Item.page(params[:page]).per(10)
    end
  end

  def show
  end

  def new
    @item = Item.new
    @disk = @item.disks.build
    @song = @disk.songs.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_item_path(@item)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to admins_item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to admins_items_path
  end

  private
  
  def item_params
    params.require(:item).permit(:title, :price, :status, :stock, :jacket_image, :artist_id, :label_id, :genre_id, disks_attributes: [
      :id, :_destroy, songs_attributes: [
        :id, :title, :_destroy
        ]
      ]
    )
  end

  def set_item
     @item = Item.find(params[:id])
  end
end

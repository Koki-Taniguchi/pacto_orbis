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
      flash[:notice] = "新規作成に成功しました"
      redirect_to admins_item_path(@item)
    else
      flash[:error] = "新規作成に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    params[:item][:status] = "false" if params[:item][:stock].to_i <= 0
    if @item.update(item_params)
      flash[:notice] = "更新に成功しました"
      redirect_to admins_item_path(@item)
    else
      flash[:error] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    if @item.update({status: false})
      flash[:notice] = "商品を「売り切れ」にしました"
    end
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

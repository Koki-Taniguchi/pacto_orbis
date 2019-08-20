class Admins::ArtistsController < Admins::Base
  def index
    @artists = Artist.page(params[:page]).per(10)
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:notice] = "新規作成に成功しました"
      redirect_to admins_artists_path
    else
      @artists = Artist.page(params[:page]).per(10)
      flash[:error] = "新規作成に失敗しました"
      render :index
    end
  end

  def edit
    @artist = Artist.find(params[:id])
    @artists = Artist.page(params[:page]).per(10)
    render :index
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      flash[:notice] = "更新に成功しました"
      redirect_to admins_artists_path
    else
      @artists = Artist.page(params[:page]).per(10)
      flash[:error] = "更新に失敗しました"
      render :index
    end
  end

  def destroy
    artist = Artist.find(params[:id])
    if artist.destroy
      flash[:notice] = "削除に成功しました"
    end
    redirect_to admins_artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end

end

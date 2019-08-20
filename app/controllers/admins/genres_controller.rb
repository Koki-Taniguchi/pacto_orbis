class Admins::GenresController < Admins::Base
  def index
    @genres = Genre.page(params[:page]).per(10)
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "新規作成に成功しました"
      redirect_to admins_genres_path
    else
      @genres = Genre.page(params[:page]).per(10)
      flash[:error] = "新規作成に失敗しました"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
    @genres = Genre.all
    render :index
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "更新に成功しました"
      redirect_to admins_genres_path
    else
      @genres = Genre.page(params[:page]).per(10)
      flash[:error] = "更新に失敗しました"
      render :index
    end
  end

  def destroy
    genre = Genre.find(params[:id])
    if genre.destroy
      flash[:notice] = "削除に成功しました"
    end
    redirect_to admins_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end

class Admins::LabelsController < Admins::Base
  def index
    @labels = Label.page(params[:page]).per(10)
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      flash[:notice] = "新規作成に成功しました"
      redirect_to admins_labels_path
    else
      @labels = Label.page(params[:page]).per(10)
      flash[:error] = "新規作成に失敗しました"
      render :index
    end
  end

  def edit
    @label = Label.find(params[:id])
    @labels = Label.page(params[:page]).per(10)
    render :index
  end

  def update
    @label = Label.find(params[:id])
    if @label.update(label_params)
      flash[:notice] = "更新に成功しました"
      redirect_to admins_labels_path
    else
      @labels = Label.page(params[:page]).per(10)
      flash[:error] = "更新に失敗しました"
      render :index
    end
  end

  def destroy
    label = Label.find(params[:id])
    if label.destroy
      flash[:notice] = "削除に成功しました"
    end
    redirect_to admins_labels_path
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end

end

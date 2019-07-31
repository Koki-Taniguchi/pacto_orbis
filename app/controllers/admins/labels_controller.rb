class Admins::LabelsController < ApplicationController
  def index
    @labels = Label.all
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to admins_labels_path
    else
      @labels = Label.all
      render :index
    end
  end

  def edit
    @label = Label.find(params[:id])
    @labels = Label.all
    render :index
  end

  def update
    @label = Label.find(params[:id])
    if @label.update(label_params)
      redirect_to admins_labels_path
    else
      @labels = Label.all
      render :index
    end
  end

  def destroy
    label = Label.find(params[:id])
    label.destroy
    redirect_to admins_labels_path
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end

end

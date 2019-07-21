class Admin::LabelsController < ApplicationController
  def index

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy
    
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end

end

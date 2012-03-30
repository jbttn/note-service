class LabelsController < ApplicationController
  
  def show
    @label = Label.find(params[:id])
    @notes = @label.notes.recent.paginate(page: params[:page])
  end
  
  def create
    @label = Label.new(params[:label])
    @label.owner = current_user
    
    if @label.save
      redirect_to root_path, :flash => {:success => "Label created!"}
    else
      redirect_to root_path, :flash => {:error => "Label creation failed!"}
    end
  end
end

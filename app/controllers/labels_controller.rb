class LabelsController < ApplicationController
  
  def show
    if params[:id] == '0'
      @label = Label.new(name: 'Unlabeled')
      @notes = current_user.notes.unlabeled.paginate(page: params[:page])
    else
      @label = Label.find(params[:id])
      @notes = @label.notes.recent.paginate(page: params[:page])
    end
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

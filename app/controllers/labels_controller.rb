class LabelsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorized, only: [:show, :update, :destroy]
  
  def show
    if params[:id] == 'unlabeled'
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
  
  def destroy
    # Need to set any notes with this label to nil
    @label = Label.find(params[:id])
    @label.destroy
    redirect_to root_path, flash: { success: 'Label deleted!' }
  end
  
  private
  
    def authorized
      if params[:id] != 'unlabeled'
        @label = Label.find(params[:id])
        redirect_to root_path if @label.owner != current_user
      end
    end
end

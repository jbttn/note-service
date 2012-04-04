class NotesController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :undistracted]
  before_filter :authorized, only: [:edit, :update, :destroy]
  
  def index
    @notes = Note.all
  end
  
  def show
    @note = Note.find(params[:id])
    @note.increment_hits
    
    respond_to do |format|
      format.html
      format.text
    end
  end
  
  def new
    @note = Note.new
  end
  
  def create
    @note = Note.new(params[:note])
    @note.owner = current_user
    
    if @note.save
      redirect_to @note
    else
      render action: "new"
    end
  end
  
  def edit
    @note = Note.find(params[:id])
  end
  
  def update
    @note = Note.find(params[:id])
    
    if @note.update_attributes(params[:note])
      redirect_to @note, flash: { success: 'Note updated successfully!' }
    else
      render :edit
    end
  end
  
  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to root_path, flash: { success: 'Note deleted!' }
  end
  
  def undistracted
    @note = Note.find(params[:id])
    render layout: 'undistracted'
  end
  
  private
  
    def authorized
      @note = Note.find(params[:id])
      redirect_to root_path if @note.owner != current_user
    end
end

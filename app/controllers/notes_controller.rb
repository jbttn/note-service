class NotesController < ApplicationController
  def index
    @notes = Note.all
  end
  
  def show
    @note = Note.find(params[:id])
    @note.increment_hits
  end
  
  def new
    @note = Note.new
  end
  
  def create
    @note = Note.new(params[:note])
    @note.owner = current_user
    
    if @note.save
      redirect_to @note, :flash => {:success => "Note created!"}
    else
      render action: "new"
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def undistracted
    @note = Note.find(params[:id])
    render layout: 'undistracted'
  end
end

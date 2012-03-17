class TagsController < ApplicationController
  def show
    @notes = Note.tagged_with(params[:tag]).uniq
  end
end

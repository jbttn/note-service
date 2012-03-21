class PagesController < ApplicationController
  before_filter :authenticate_user!, only: [:markdownify]
  
  def welcome
    if(user_signed_in?)
      redirect_to dashboard_path
    end
  end
  
  def about
  end
  
  def markdownify
    render text: markdown(params[:note])
  end
end

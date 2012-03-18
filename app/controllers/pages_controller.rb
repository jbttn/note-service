class PagesController < ApplicationController
  before_filter :authenticate_user!, only: [:dashboard, :markdownify]
  
  def welcome
    if(user_signed_in?)
      redirect_to dashboard_path
    end
  end
  
  def dashboard
  end
  
  def about
  end
  
  def markdownify
    render text: markdown(params[:note])
  end
end

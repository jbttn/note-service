class PagesController < ApplicationController
  before_filter :authenticate_user!
  
  def dashboard
  end
  
  def about
  end
end

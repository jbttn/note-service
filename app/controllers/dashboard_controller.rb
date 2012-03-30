class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end
  
  def notes
    @notes = current_user.notes.recent.paginate(page: params[:page])
  end
  
  def labels
    @labels = current_user.labels
  end
end

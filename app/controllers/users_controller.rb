class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:current]
  respond_to :html, :json
  
  def index
    respond_with(@users = User.all)
  end
  
  def show
    respond_with(@user = User.find(params[:id]))
  end
  
  def current
    respond_with(current_user)
  end
end

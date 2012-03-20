class UsersController < ApplicationController
  respond_to :html, :json
  
  def show
    respond_with(@user = User.find(params[:id]))
  end
end

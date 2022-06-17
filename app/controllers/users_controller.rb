class UsersController < ApplicationController
  
  def show
    @users = User.find(params[:id])
    @asks = @users.asks
  end
end

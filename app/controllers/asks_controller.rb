class AsksController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_ask, only: [:show,:edit,:update, :destroy]
  def index
    @ask=Ask.all
  end

  def new
    @ask=Ask.new
  end

  def create
    @ask=Ask.new(ask_params)
     if @ask.save
    redirect_to root_path
    else
      render action: :new
    end
  end

  def destroy
    ask= Ask.find(params[:id])
    ask.destroy
    redirect_to action: :index
  end


  def show
    @ask= Ask.find(params[:id])
    @comment = Comment.new
    @comments = @ask.comments.includes(:user)
  end

  def edit
    @ask = Ask.find(params[:id])
  end


  def update
    @ask = Ask.find(params[:id])
    if @ask.update(ask_params)
        redirect_to root_path
       else
         render action: :edit
       end
  end

  
  private


  def ask_params
    params.require(:ask).permit(:title, :text).merge(user_id: current_user.id)
  end


  # def set_item
  #   @ask= Ask.find(params[:id])
  # end
  # def move_to_index
  #   unless user_signed_in?
  #   redirect_to action: :index
  #   end
  # end
end

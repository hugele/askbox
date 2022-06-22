class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/asks/#{comment.ask.id}"
  end
  

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, ask_id: params[:ask_id])
  end
end



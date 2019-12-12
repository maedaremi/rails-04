class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    byebug
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id] 
  
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      flash.now[:danger] = 'コメントに失敗しました'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :topic_id, :comment)
  end
end


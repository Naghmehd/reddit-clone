class  CommentsController < ApplicationController
  before_action do
    @post = Post.find(params[:post_id])
  end

  def index
    @comments = @post.comments
  end
  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_comments_path(@post)
  end

Private
  def comment_params
    params.require(:comment).permit(:description, :post_id)
  end
end

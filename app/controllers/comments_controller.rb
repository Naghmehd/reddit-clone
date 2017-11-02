class  CommentsController < ApplicationController
  before_action :find_post, only: :new

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(post_id: comment_params[:post_id])
    else
      flash[:error] = @comment.errors.full_messages
      redirect_to new_comment_path(post_id: comment_params[:post_id])
    end
  end

private

  def find_post
    #<PostObject id: 4, title: 'sometime', 'desc', 'link' >
    @post = Post.find(params[:post_id])
  end

  def comment_params
    # { comment: { description: 'some description', post_id: 4 } }
    params.require(:comment).permit(:description, :post_id)
  end

end

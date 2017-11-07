class  CommentsController < ApplicationController
  before_action :required_user, except: [:index, :show]
  before_action :find_post, only: [:new, :show]

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      # redirect_to post_path(@post)
      redirect_to post_path(@comment.post.id)
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

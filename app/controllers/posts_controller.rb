class  PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @posts = Post.new
  end

  def create
    @post = Post.new(post_params)
       if @post.save
         flash[:notice] = 'Post was successfully created.'
        redirect_to root_path
       else
         flash[:error] = @post.errors.full_messages
         render new_post_path
       end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:notice] = "Post deleted"
    redirect_to root_path
  end

private
  def post_params
    params.require(:post).permit(:title, :description, :link)
  end

end

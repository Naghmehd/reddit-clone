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
    respond_to do |format|
       if @post.save
         flash[:notice] = 'Post was successfully created.'
         format.html { redirect_to root_path }
       else
         flash[:error] = @post.errors.full_messages
         format.html { render new_post_path }
       end
     end
  end

private
  def post_params
    params.require(:post).permit(:title, :description, :link)
  end

end

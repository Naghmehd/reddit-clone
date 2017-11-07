class  PostsController < ApplicationController
  before_action :required_user, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = find_post
    @comments = @post.comments
  end

  def new
    @posts = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
       if @post.save!
        flash[:notice] = 'Post was successfully created.'
        redirect_to post_path(@post, post_id: @post.id)
       else
         flash[:error] = @post.errors.full_messages
         render new_post_path
       end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash[:notice] = "Post deleted"
    redirect_to root_path
  end

private
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :link, :user_id)
  end

end

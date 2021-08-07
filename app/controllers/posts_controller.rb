class PostsController < ApplicationController

  def index 
    @posts = Post.all 
    @post = Post.new

  end

  def new 
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @posts = Post.all

    if @post.save
      redirect_to root_path, notice: "Post was successfully created." 
    else
      render action: "index"
    end
  end

  def show 
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end 
  end

  def destroy 
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end

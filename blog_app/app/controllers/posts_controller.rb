class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(require_params)
    if @post.save
      flash.notice = "<div class='flash-success'>Post was successfully created!</div>"
      redirect_to posts_path
    else
      flash.notice = "<div class='flash-failure'>Post was unable to be created.</div>"
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(require_params) then
      flash.notice = "<div class='flash-success'>Post was successfully updated!</div>"
      redirect_to posts_path
    else
      flash.notice = "<div class='flash-failure'>There was an error while updating your post</div>"
      redirect_to edit_post_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy then
      flash.notice = "<div class='flash-success'>Post was successfully deleted!</div>"
    else
      flash.notice = "<div class='flash-failure'>There was an error while deleting your post</div>"
    end
    redirect_to posts_path
  end

  private
  def require_params
    params.require(:post).permit(:title, :description)
  end
end

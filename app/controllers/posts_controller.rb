class PostsController < ApplicationController
  def index
    @search = Post.ransack(params[:q])
    @posts = @search.result
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(post: @post)
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Your post has been saved.'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_path, notice: 'Your post has been updated.'
    else
      redirect_to :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Your post has been deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end

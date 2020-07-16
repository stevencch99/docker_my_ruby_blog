class ApplicationController < ActionController::Base
  helper_method :all_categories, :recent_posts
  before_action :site_search

  def all_categories
    @categories = Category.all
  end

  def recent_posts
    @posts = Post.order(created_at: :desc).limit(10)
  end

  def site_search
    @search = Post.ransack(params[:q])
    @search_posts = @search.result
  end
end

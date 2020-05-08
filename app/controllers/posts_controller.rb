class PostsController < ApplicationController
  def index
    @new_post = Post.new
    @all_posts = Post.order(created_at: :desc).all
  end

  def create
    @new_post = Post.new(post_params)
    if @new_post.save
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:comment)
  end
end

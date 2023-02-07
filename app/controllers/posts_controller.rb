class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.includes(posts: { comments: [:author] }).find(user_id)
    @posts = @user.posts
    @recent_user = current_user
  end

  def show
    user_id = params[:user_id]
    # post_id = params[:post_id]
    @user = User.includes(posts: { comments: [:author] }).find(user_id)
    @posts = @user.posts
    @recent_user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    user = current_user
    @post = Post.new(
      title: params[:post][:title],
      text: params[:post][:text],
      author: user
    )
    return unless @post.save

    redirect_to user_posts_path
  end
end

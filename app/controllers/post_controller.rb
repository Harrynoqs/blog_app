class PostController < ApplicationController

  def index
    puts :posts
  end

  def view
    user_id = param[:id].to_i
    @posts = Post.where(user_id == :author_id)
  end
end

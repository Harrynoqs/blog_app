class Like < ApplicationRecord
  after_create :update_likes_counter
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def update_likes_counter
    post_id = post.id
    Post.increment_counter(:likes_counter, post_id)
  end
end

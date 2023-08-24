class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Method to update the comments counter for a post
  after_create :update_post_comments_counter

  def update_post_comments_counter
    post.increment(:comments_counter)
  end
end

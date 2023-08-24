class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Method to update the likes counter for a post
  after_create :update_post_likes_counter

  private

  def update_post_likes_counter
    post.increment!(:likes_counter)
  end
end

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

  validates_presence_of :title
  validates :title, length: { maximum: 250 }
  after_save :update_user_post_count
  after_create :recent_comments

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  private

  def update_user_post_count
    author&.increment!(:posts_counter)
    # author.update(posts_counter: author.posts.count)
  end
end

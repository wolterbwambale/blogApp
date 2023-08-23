class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates_presence_of :title, :text
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :recent, -> { order(created_at: :desc) }

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  def total_likes
    likes_counter || likes.count
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#recent_posts' do
    it 'returns the most recent posts' do
      user = User.create(
        name: 'test user',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'test_bio',
        posts_counter: 1
      )

      posts = (1..5).map do |i|
        Post.create(
          author: user,
          title: "Post #{i}",
          text: "Text #{i}",
          likes_counter: 0,
          comments_counter: 0
        )
      end

      sorted_posts = posts.sort_by(&:created_at).reverse

      expected_posts = sorted_posts.first(3)

      expect(user.recent_posts).to eq(expected_posts)
    end

    it 'returns an empty array if user has no posts' do
      user = User.create(
        name: 'test user',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'test_bio',
        posts_counter: 0
      )

      expect(user.recent_posts).to be_empty
    end
  end
end

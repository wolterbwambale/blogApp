require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_post_likes_counter' do
    let(:user) { User.create(name: 'Tom', photo: 'https://example.com/tom.jpg', bio: 'Teacher from Mexico.') }
    let(:post) { Post.create(title: 'Sample Post') }
    let!(:like) { Like.create(user_id: user.id, post_id: post.id) }

    it 'increments the likes_counter of the associated post' do
      expect {
        like.update_post_likes_counter
      }.to change { post.reload.likes_counter }.by(1)
    end
  end
end

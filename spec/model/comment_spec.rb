require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Tom', photo: 'https://example.com/tom.jpg', bio: 'Teacher from Mexico.', posts_counter: 0) }
  let(:post) { Post.create(author_id: user.id, title: 'Sample Post', comments_counter: 0, likes_counter: 0) }
  let(:comment) { Comment.create(author_id: user.id, post_id: post.id) }

  it 'creating a comment and not saving it will keep post comments counter as default' do
    expect(post.comments_counter).to eq(0)
  end

  it 'saving or creating a new comment will trigger update_post_comments_counter automatically' do
    comment.save # Save the comment to trigger the after_save callback.
    post.reload
    expect(post.comments_counter).to eq(1)
  end
end

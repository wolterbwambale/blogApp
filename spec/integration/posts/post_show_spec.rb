require 'rails_helper'

RSpec.describe 'post index view page', type: :system do
  let!(:user1) do
    User.create(
      name: 'test user1',
      photo: 'https://images3.alphacoders.com/690/690494.jpg',
      bio: 'test_bio1',
      posts_counter: 1
    )
  end

  let!(:post1) do
    Post.create(author: user1, title: 'Post 1', text: 'Post 1 content', comments_counter: 3, likes_counter: 0)
  end

  let!(:comment1) do
    Comment.create(post: post1, user: user1, text: 'good!')
  end
  let!(:comment2) do
    Comment.create(post: post1, user: user1, text: 'good!')
  end
  let!(:comment3) do
    Comment.create(post: post1, user: user1, text: 'good!')
  end

  describe 'show correct post for user1' do
    before(:example) do
      visit user_post_path(user1, post1)
    end

    it 'displays the post title' do
      expect(page).to have_content(post1.title)
    end

    it 'displays the post author' do
      puts "DEBUG: Author name: #{user1.name}"
      expect(page).to have_content("Author: #{user1.name}")
    end

    it 'displays the number of likes' do
      puts "DEBUG: Likes count: #{post1.likes_counter}"
      expect(page).to have_content("Likes: #{post1.likes_counter}")
    end

    it 'displays the number of comments' do
      puts "DEBUG: Comments count: #{post1.comments_counter}"
      expect(page).to have_content("Comments: #{post1.comments_counter}")
    end

 

    it 'displays the post body' do
      expect(page).to have_content(post1.text)
    end

    it 'displays the username of each commenter' do
      expect(page).to have_content(comment1.user.name)
      expect(page).to have_content(comment2.user.name)
      expect(page).to have_content(comment3.user.name)
    end

    it 'displays the comment left by each commenter' do
      expect(page).to have_content(comment1.text)
      expect(page).to have_content(comment2.text)
      expect(page).to have_content(comment3.text)
    end
  end
end

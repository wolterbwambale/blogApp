require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) do
    User.create(
      name: 'test user',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'test_bio',
      posts_counter: 1
    )
  end

  let!(:post) do
    Post.create(
      author: user,
      title: 'Hello',
      text: 'This is my first post',
      comments_counter: 1,
      likes_counter: 1
    )
  end

  context 'GET /index' do
    before { get "/users/#{user.id}/posts" }

    it 'displays a list of posts' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('list of posts')
    end
  end

  context 'GET /show' do
    before { get "/users/#{user.id}/posts/#{post.id}" }

    it 'displays the post details for a given post' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template('show')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end
end

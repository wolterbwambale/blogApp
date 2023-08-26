# require 'rails_helper'

# RSpec.describe Like, type: :model do
#   describe '#update_likes_counter' do
#     let(:user1) { create(:user) }
#     let(:user2) { create(:user) }
#     let(:post) { create(:post, author: user1, likes_counter: 1, comments_counter: 1) }
#     let!(:like) { create(:like, post:, user: user2) }

#     it 'increases the likes counter of the associated post' do
#       expect do
#         like.update_likes_counter
#         post.reload
#       end.to change(post, :likes_counter).by(1)
#     end
#   end
# end

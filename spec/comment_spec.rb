require 'rails_helper'
require 'spec_helper'

describe Comment, type: :model do

 describe 'comments' do
  describe 'build_with_user_and_picture' do

    let(:user) { User.create email: 'test@test.com' }
    let(:picture) { Picture.create title: 'Test' }
    let(:comment_params) { {thoughts: 'cool!'} }

    subject(:comment) { picture.comments.build_with_user(comment_params, user) }
    it 'builds a comment' do
      expect(comment).to be_a Comment
    end

    it 'builds a comment associated with the specified user' do
      expect(comment.user).to eq user
    end

    # it 'builds a comment associated with the specified picture' do
    #   expect(comment.picture).to eq picture
    # end
  end
end

end

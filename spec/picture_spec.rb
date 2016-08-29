require 'rails_helper'
require 'spec_helper'

describe Picture, type: :model do

  describe 'pictures' do
    describe 'build_with_user' do

      let(:user) { User.create email: 'test@test.com' }
      let(:picture) { Picture.create title: 'Test' }
      subject(:picture) { user.pictures.build_with_user(picture_params, user) }

      it 'builds a picture' do
        # expect(picture).to be_a Picture
      end

      it 'builds a picture associated with the specified user' do
        # expect(picture.user).to eq user
      end

    end
  end

end

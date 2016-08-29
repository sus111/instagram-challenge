require 'rails_helper'

feature 'liking pictures' do
  before do
    sign_up
    add_picture
    leave_comment
  end

  scenario 'a user can like a picture, which updates the like count' do
    visit '/pictures'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end

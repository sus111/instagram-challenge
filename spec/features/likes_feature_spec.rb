require 'rails_helper'

feature 'liking pictures' do
  before do
    sign_up
    add_picture
  end

  scenario 'a user can like a picture, which updates the like count' do
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

  scenario 'a user cannot like a picture more than once' do
    click_link 'Like'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end

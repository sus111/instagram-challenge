require 'rails_helper'

feature 'leaving comments' do

  before { Picture.create title: 'Beach life!' }

  scenario 'allows users to comment on a picture' do
    leave_comment

    expect(current_path).to eq '/pictures'
    expect(page).to have_content('1 comments')
  end

  scenario 'allows users to comment multiple times on a picture' do
    leave_comment
    leave_comment(thoughts: "wow!")
    expect(current_path).to eq '/pictures'
    expect(page).to have_content('2 comments')
  end

  # scenario 'show multiple comments' do
  #   leave_comment
  #   leave_comment(thoughts: "wow!")
  #   # click_link()
  #   # expect(current_path).to eq "/pictures/#{picture.id}"
  #   expect(page).to have_content('Looks beautiful!')
  #   expect(page).to have_content('wow!')
  # end

end

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


end

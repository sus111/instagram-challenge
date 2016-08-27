require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_content 'Add Picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(title: 'Beach life!')
    end

    scenario 'displays picture' do
      visit '/pictures'
      expect(page).to have_content('Beach life!')
      # save_and_open_page
      expect(page).not_to have_content('No picutres yet')
    end
  end

  context 'upload picture' do
    scenario 'promts user to add a picture with a title' do
      visit '/pictures'
      click_link 'Add Picture'
      fill_in 'Title', with: 'Beach life!'
      click_button 'Create Picture'
      expect(page).to have_content 'Beach life!'
      expect(current_path).to eq '/pictures'
    end

    # scenario 'promts user to add a picture with a file upload' do
    #   visit '/pictures'
    #   click_link 'Add Picture'
    #   fill_in 'Title', with: 'Beach life!'
    #   click_lick 'Choose File'
    #   click_button 'Create Picture'
    #   expect(page).to have_content 'Beach life!'
    #   expect(current_path).to eq '/pictures'
    # end
  end

end

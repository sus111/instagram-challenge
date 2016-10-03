require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      sign_up
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_content 'Add Picture'
    end
  end

  context 'upload picture' do
    scenario 'promts user to add a picture with a title' do
      sign_up
      add_picture
      expect(page).to have_content 'Beach life!'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'pictures have been added' do
    before do
      sign_up
      add_picture
    end

    scenario 'displays picture' do
      visit '/pictures'
      expect(page).to have_content('Beach life!')
      expect(page).not_to have_content('No picutres yet')
    end

    # scenario 'displays user who posted picture' do
    #   visit '/pictures'
    #   sign_up
    #   add_picture
    #   expect(page).to have_content('test@test.com')
    # end

    scenario 'let a user edit a picture title' do
      click_link 'Beach life!'
      fill_in 'Title', with: 'Sooo sunny!!'
      click_button 'Update Picture'
      expect(page).to have_content 'Sooo sunny!!'
      expect(page).not_to have_content 'Beach life!'
      expect(current_path).to eq '/pictures'
    end

    scenario 'removes a picture when user clicks a delete link' do
      click_link 'Delete'
      expect(page).not_to have_content 'Beach life!'
      expect(page).to have_content 'Your picture has been deleted'
    end

    scenario 'displays picture on seperate page' do
      visit '/pictures'
      # click_link picture
    end
  end

    # scenario 'promts user to add a picture with a file upload' do
    #   visit '/pictures'
    #   click_link 'Add Picture'
    #   fill_in 'Title', with: 'Beach life!'
    #   attach_file('Image', '/path/to/image.jpg')
    #   click_button 'Create Picture'
    #   expect(page).to have_content 'Beach life!'
    #   expect(current_path).to eq '/pictures'
    # end

end

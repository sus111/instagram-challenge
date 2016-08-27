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
      expect(page).not_to have_content('No picutres yet')
    end
  end

end

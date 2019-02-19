require 'rails_helper'

describe 'As a user' do
  describe 'when I visit the root' do
    it 'should show me an image of space' do
      visit '/'

      expect(page).to have_content("Welcome to Curious Space!")
      expect(page).to have_content("Here's a photo from Mars:")
      expect(page).to have_content("Sol (Martian Date):")
      expect(page).to have_content("Rover:")
      expect(page).to have_content("Camera:")
      expect(page).to have_content("Landed on Mars:")
    end
  end
end

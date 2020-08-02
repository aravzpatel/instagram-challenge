require 'rails_helper'

RSpec.describe User, type: :feature do
  context 'when not signed in' do
    it 'should be able to register' do
      visit '/'
      fill_in 'user[username]', with: 'starr'
      fill_in 'user[email]', with: 'starr@one.com'
      fill_in 'user[password]', with: 'something;lkfajd'

      click_button 'Create User'

      expect(page).to have_content('Welcome to the gram Starr')
    end
  end
  
  context 'error messages are showed if form is submitted incorrectly' do
    it 'a username must be submitted' do
      visit '/'
      fill_in 'user[email]', with: 'starr@one.com'
      fill_in 'user[password]', with: 'something;lkfajd'

      click_button 'Create User'

      expect(page).to have_content("Username can't be blank")
    end

    it 'a password must be submitted' do
      visit '/'
      fill_in 'user[username]', with: 'starr@one.com'
      fill_in 'user[email]', with: 'starr@one.com'

      click_button 'Create User'

      expect(page).to have_content("Password can't be blank")
    end

    it 'an email must be submitted' do
      visit '/'
      fill_in 'user[username]', with: 'starr@one.com'
      fill_in 'user[password]', with: 'afdafdas'

      click_button 'Create User'

      expect(page).to have_content("Email can't be blank")
    end
  end
end
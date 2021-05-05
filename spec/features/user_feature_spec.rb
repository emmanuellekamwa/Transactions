require 'rails_helper'

RSpec.feature 'UserFeatures', type: :feature do
  context 'not logged in' do
    it 'can load a login page' do
      visit login_path
      expect(page).to have_content 'LOGIN'
    end

    it 'show a home page' do
      visit root_path
      expect(page).to have_css('h1', text: 'Transactions')
    end
  end
end
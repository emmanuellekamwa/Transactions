require 'rails_helper'

RSpec.feature 'GroupFeatures', type: :feature do
  before do
    login_url
  end

  it 'renders a new group page' do
    visit new_group_url
    expect(page).to have_content 'NEW GROUP'
  end

  it 'shows a list of all the created groups' do
    visit groups_path
    expect(page).to have_content 'GROUPS'
  end
end
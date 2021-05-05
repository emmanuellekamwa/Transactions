require 'rails_helper'

RSpec.feature 'TransactionFeatures', type: :feature do
  before do
    login_url
  end

  it 'renders a new transaction page' do
    visit new_transaction_url
    expect(page).to have_content 'NEW TRANSACTION'
  end
end

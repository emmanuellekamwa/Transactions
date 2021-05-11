require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user1 = User.new(name: 'User01')
  end

  it 'can create a new user' do
    @user1.save
    expect(@user1.valid?).to eq(true)
  end

  it "doesn't create user with an empty name" do
    @user2 = User.create(name: '')
    expect(@user2.valid?).to eq false
  end

  it 'creates a user only if the name is unique' do
    @user1.save
    @user2 = User.create(name: @user1.name.to_s)
    expect(@user2.valid?).to eq false
  end

  it 'creates a user with a name with capitals' do
    expect(@user1.name[0] == @user1.name[0].upcase).to eq true
  end

  after(:all) { User.destroy_all }
end
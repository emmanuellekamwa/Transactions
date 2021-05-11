require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before(:all) do
    @user = User.create(name: 'User')
  end

  context 'test with one created user' do
    before(:each) do
      @transaction1 = Transaction.new(name: 'Transaction01',
                                      description: 'description for trans 01',
                                      amount: 0.50,
                                      user_id: @user.id)
    end

    it 'creates a new transaction' do
      @transaction1.save
      expect(@transaction1.valid?).to eq(true)
    end

    it "doesn't create a transaction with an empty name, amount or description" do
      @transaction2 = Transaction.create(name: '',
                                         description: '',
                                         amount: nil,
                                         user_id: @user.id)
      expect(@transaction2.valid?).to eq false
    end

    it 'creates a transaction only if the name is unique' do
      @transaction1.save
      @transaction2 = Transaction.create(name: @transaction1.name.to_s,
                                         description: 'description for trans 01',
                                         amount: 1.50,
                                         user_id: @user.id)
      expect(@transaction2.valid?).to eq false
    end

    it 'creates a transaction not needing to belong to a group' do
      @transaction1.save
      expect(@transaction1.group.nil? & @transaction1.valid?).to eq true
    end

    it 'has to belong to a user' do
      @transaction1.user_id = nil
      @transaction1.save
      expect(@transaction1.valid?).to eq false
    end
  end

  after(:all) do
    User.destroy_all &
      Group.destroy_all &
      Transaction.destroy_all
  end
end

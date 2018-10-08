require 'account'

describe Account do

  subject(:account) { described_class.new }

  describe '#initialize' do
    it 'initializes a new account with a zero balance' do
      expect(account.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'adds money to the account balance' do
      expect { account.deposit(1000) }.to change { account.balance }.by(1000)
    end
  end

  describe '#withdrawal' do
    it 'withdraws money from the account' do
      expect(account).to respond_to(:withdraw).with(1).argument
    end

    it 'changes the balance by the amount' do
      expect { account.withdraw(500) }.to change { account.balance }.by(-500)
    end
  end
end

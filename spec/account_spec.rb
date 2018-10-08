require 'account'

describe Account do

  subject(:account) { described_class.new }

  describe '#initialize' do
    it 'initializes a new account with a zero balance' do
      expect(account.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'adds money to the account' do
      expect(account).to respond_to(:deposit).with(1).argument
    end
  end
end

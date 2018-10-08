require 'account'

describe Account do

  subject(:account) { described_class.new }

  describe '#initialize' do
    it 'initializes a new account with a zero balance' do
      expect(account.balance).to eq(0)
    end
  end
end

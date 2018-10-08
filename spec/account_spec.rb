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
    it 'only accepts integer values as argument' do
      expect { account.deposit("one thousand pounds") }.to raise_error 'Error: amount must be entered as an integer'
    end
    it 'only accepts positive numbers' do
      expect { account.deposit(-1000) }.to raise_error 'Error: amount must be positive'
    end
  end

  describe '#withdrawal' do
    it 'changes the balance by the amount' do
      expect { account.withdraw(500) }.to change { account.balance }.by(-500)
    end
    it 'only accepts integer values as argument' do
      expect { account.withdraw("five hundred pounds") }.to raise_error 'Error: amount must be entered as an integer'
    end
    it 'only accepts positive numbers' do
      expect { account.withdraw(-500) }.to raise_error 'Error: amount must be positive'
    end

  end
end

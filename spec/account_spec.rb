require 'account'

describe Account do

  let(:mock_printer) { double :printer, print_statement: 'statement' }
  let(:mock_transaction) { double :transaction, new: nil }

  subject(:account) { described_class.new(mock_printer, mock_transaction) }

  describe '#deposit' do
    it 'creates a new Transaction object' do
      expect(mock_transaction).to receive(:new).with(balance: 1000, cash_value: 1000)
      account.deposit(1000)
    end
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
    it 'creates a new Transaction object' do
      account.deposit(2000)
      expect(mock_transaction).to receive(:new).with(balance: 1000, cash_value: -1000)
      account.withdraw(1000)
    end
    it 'changes the balance by the amount' do
      account.deposit(1000)
      expect { account.withdraw(500) }.to change { account.balance }.by(-500)
    end
    it 'only accepts integer values as argument' do
      expect { account.withdraw("five hundred pounds") }.to raise_error 'Error: amount must be entered as an integer'
    end
    it 'only accepts positive numbers' do
      expect { account.withdraw(-500) }.to raise_error 'Error: amount must be positive'
    end
    it 'will not allow withdrawals larger than the current balance' do
      account.deposit(1000)
      expect { account.withdraw(1001) }.to raise_error 'Error: not enough money in account'
    end
  end

  describe '#statement' do
    it 'printer can receive print_statement' do
      expect(mock_printer).to receive(:print_statement).with(subject.cashflows)
      account.statement
    end
  end
end

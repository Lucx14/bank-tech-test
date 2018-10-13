require 'account'

describe Account do

  let(:mock_printer) { double :mock_printer, print_statement: 'statement' }
  subject(:account) { described_class.new(mock_printer) }

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
    it 'creates a record of the cashflow with date and resulting balance' do
      allow(Time).to receive(:now).and_return(@time_now)
      account.deposit(1000)
      expect(account.cashflows.size).to eq(1)
      expect(account.cashflows[0]).to eq({ :date => @time_now, :credit => 1000, :debit => nil, :balance => 1000 })
    end
  end

  describe '#withdrawal' do
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
    it 'creates a record of the cashflow with date and resulting balance' do
      allow(Time).to receive(:now).and_return(@time_now)
      account.deposit(1000)
      account.withdraw(500)
      expect(account.cashflows.size).to eq(2)
      expect(account.cashflows[1]).to eq({ :date => @time_now, :credit => nil, :debit => 500, :balance => 500 })
    end
  end

  describe '#statement' do
    it 'calls #print_statement from printer' do
      expect(mock_printer).to receive(:print_statement).with(subject.cashflows)
      account.statement
    end
  end
end

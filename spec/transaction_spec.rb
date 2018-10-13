require 'transaction'

describe Transaction do

  subject(:transaction) { described_class.new(500, 1000) }

  describe '#date' do
    it 'can read the date attribute' do
      allow(Time).to receive(:now).and_return(Time.mktime(2018, 10, 13))
      expect(transaction.date).to eq(Time.mktime(2018, 10, 13))
    end
  end

  describe '#credt' do
    it 'can read the credit attribute' do
      expect(transaction.credit).to eq(1000)
    end
  end

  describe '#debit' do
    it 'can read the debit attribute' do
      expect(transaction.debit).to eq(nil)
    end
  end

  describe '#balance' do
    it 'can read the balance attribute' do
      expect(transaction.balance).to eq(500)
    end
  end

  describe '#initialize' do
    it 'can correctly determine debit or credit' do
      new_transaction = Transaction.new(1000, -200)
      expect(new_transaction.credit).to eq(nil)
      expect(new_transaction.debit).to eq(200)
    end
  end

end

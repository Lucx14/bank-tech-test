require 'printer'

describe Printer do

  let(:dummy_class) { Class.new { include Printer } }
  let(:transaction) { double :transaction, date: Time.mktime(2018, 10, 13), credit: 1000, debit: nil, balance: 1000 }
  let(:transaction2) { double :transaction, date: Time.mktime(2018, 10, 13), credit: nil, debit: 600, balance: 400 }

  before do
    @cashflows = [transaction, transaction2]
  end

  describe '#headers' do
    it 'prints a formatted headers string' do
      expect(subject.headers).to eq("date || credit || debit || balance\n")
    end
  end

  describe '#print_transactions' do
    it 'will output a formatted bank statement' do
      expect(subject.print_transactions(@cashflows)).to eq(" 13/10/2018 ||  || 600.00 || 400.00 \n"\
                                                           " 13/10/2018 || 1000.00 ||  || 1000.00 ")
    end
  end

  describe '#print_statement' do
    it 'prints a formatted bank statement' do
      expect { subject.print_statement(@cashflows) }.to output("date || credit || debit || balance\n"\
                                                               " 13/10/2018 ||  || 600.00 || 400.00 \n"\
                                                               " 13/10/2018 || 1000.00 ||  || 1000.00 \n").to_stdout
    end
  end
end

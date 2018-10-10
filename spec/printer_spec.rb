require 'printer'

class DummyClass
end

describe Printer do
  let(:dc) { Class.new { extend Printer } }

  describe '#headers' do
    it 'prints a formatted headers string' do
      expect(dc.headers).to eq("date || credit || debit || balance")
    end
  end

  describe '#print_transactions' do
    it 'will output a formatted bank statement' do
      cashflows = [{
                     date: Time.now,
                     credit: 1000,
                     debit: nil,
                     balance: 1000
                   },
                     {
                     date: Time.now,
                     credit: 2000,
                     debit: nil,
                     balance: 3000
                     }]

      expect(dc.print_transactions(cashflows)).to eq(" 10/10/2018 || 2000.00 ||  || 3000.00 \n"\
                                                     " 10/10/2018 || 1000.00 ||  || 1000.00 ")
    end
  end
end

require 'printer'


describe Printer do
  subject(:printer) { described_class.new }

  describe '#headers' do
    it 'prints a formatted headers string' do
      expect(printer.headers).to eq("date || credit || debit || balance")
    end
  end

  describe '#print_transactions' do
    it 'will output a formatted bank statement' do
      cashflows = [{
                     date: Time.parse('2018-10-10 15:08:34 +0100'),
                     credit: 1000,
                     debit: nil,
                     balance: 1000
                   },
                     {
                     date: Time.parse('2018-10-10 15:08:34 +0100'),
                     credit: 2000,
                     debit: nil,
                     balance: 3000
                     }]

      expect(printer.print_transactions(cashflows)).to eq(" 10/10/2018 || 2000.00 ||  || 3000.00 \n"\
                                                     " 10/10/2018 || 1000.00 ||  || 1000.00 ")
    end
  end
end

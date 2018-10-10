require 'printer'

describe Printer do


  subject(:printer) { described_class.new }

  describe '#headers' do
    it 'prints a formatted headers string' do
      expect(printer.headers).to eq("date || credit || debit || balance")
    end
  end

  describe '#print_transaction' do

  end
end

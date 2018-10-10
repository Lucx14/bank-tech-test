# require 'printer'
#
# describe Printer do
#
#   let(:dummy_class) { Class.new { include Printer } }
#
#   describe '#headers' do
#     it 'prints a formatted headers string' do
#       expect(dummy_class.headers).to eq("date || credit || debit || balance")
#     end
#   end
#
#   describe '#print_transactions' do
#     it 'has a print_transactions method' do
#       expect(dummy_class).to respond_to(:print_transactions)
#     end
#     it 'will output a formatted bank statement' do
#
#       cashflows = [{ date: Time.now,
#                      credit: 1000,
#                      debit: nil,
#                      balance: 1000},
#                      {
#                      date: Time.now,
#                      credit: 2000,
#                      debit: nil,
#                      balance: 3000
#                      }]
#
#       expect(dummy_class.print_transactions(cashflows)).to eq("10/10/2018 || 2000.00 ||  || 3000.00\n10/10/2018 || 1000.00 ||  || 1000.00")
#     end
#   end
# end

describe 'User Stories' do
  # As a bank customer
  # So that I can manage my finances
  # I want to be able to open an account
  it 'so I can manage my finances, I want to open an account' do
    account = Account.new
    expect(account).to be_an_instance_of(Account)
  end


  # As a bank customer
  # So that I can build my savings
  # I want to be able to make a deposit to my bank account
  it 'so I can build my savings, I want to make a deposit' do
    account = Account.new
    expect { account.deposit(1000) }.not_to raise_error
  end

end

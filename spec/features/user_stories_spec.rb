describe 'User Stories' do
  # As a bank customer
  # So that I can manage my finances
  # I want to be able to open an account
  it 'so I can manage my finances, I want to open an account' do
    account = Account.new
    expect(account).to be_an_instance_of(Account)
  end

end

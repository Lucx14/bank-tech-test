describe 'User Stories' do
  let(:account) { Account.new }

  # As a bank customer
  # So that I can manage my finances
  # I want to be able to open an account
  it 'so I can manage my finances, I want to open an account' do
    expect(account).to be_an_instance_of(Account)
  end

  # As a bank customer
  # So that I can build my savings
  # I want to be able to make a deposit to my bank account
  it 'so I can build my savings, I want to make a deposit' do
    expect { account.deposit(1000) }.not_to raise_error
  end

  # As a bank customer
  # So that I can check how much is in my account
  # I want to be able to check my current balance
  it 'so I can see how much money I have, I want to check the balance' do
    expect(account.balance).to eq(0)
  end

  # As a bank customer
  # So that I can get cash when i need it
  # I want to be able to make a withdrawal from my account
  it 'so I can access my money, I want to make a withdrawal' do
    expect { account.withdraw(500) }.not_to raise_error
  end

  # As a bank customer
  # So that i can check my account history
  # I want to be able to get a bank account statement that includes cash flows and dates and the balance
end

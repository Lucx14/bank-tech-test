describe 'User Stories' do
  let(:account) { Account.new }

  # As a bank customer
  # So that I can build my savings
  # I want to be able to make a deposit to my bank account
  it 'so I can build my savings, I want to make a deposit' do
    account.deposit(1000)
    expect(account.balance).to eq(1000)
  end

  # As a bank customer
  # So that I can check how much is in my account
  # I want to be able to check my current balance
  it 'so I can see how much money I have, I want to check the balance' do
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
    expect(account.balance).to eq(2500)
  end

  # As a bank customer
  # So that I can get cash when i need it
  # I want to be able to make a withdrawal from my account
  it 'so I can access my money, I want to make a withdrawal' do
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
    expect(account.balance).to eq(2500)
  end

  # As a bank customer
  # So that i can check my account history
  # I want to be able to get a bank account statement that includes cash flows and dates and the balance
  it 'so I can check my cashflows, I want to request a bank statement' do
    allow(Time).to receive(:now).and_return(Time.mktime(2018, 10, 13))
    account.deposit(1000)
    allow(Time).to receive(:now).and_return(Time.mktime(2018, 10, 13))
    account.deposit(2000)
    allow(Time).to receive(:now).and_return(Time.mktime(2018, 10, 13))
    account.withdraw(500)
    expect { account.statement }.to output("date || credit || debit || balance\n "\
                                           "13/10/2018 ||  || 500.00 || 2500.00 \n "\
                                           "13/10/2018 || 2000.00 ||  || 3000.00 \n "\
                                           "13/10/2018 || 1000.00 ||  || 1000.00 \n").to_stdout
  end
end

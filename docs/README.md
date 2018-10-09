### Bank Tech Test

A simple program to model a users bank account. The program will allow a user to make deposits, make withdrawals and also print out a bank statement that will display the account history. The task requirements are shown below. Although not mentioned in the task requirements im going to introduce simple common sense edge cases such as not allowing withdrawals from an empty account. The program will be written in Ruby using RSpec as a testing framework, usage instructions below.


### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```


### Approach

after reading the specifications I picture a single object which I will call 'account'. My initial thoughts are to take the acceptance criteria and translate them into a basic set of feature tests that i would set up and run in IRB. So my user interaction/feature tests in IRB would look something like the below.

# User interaction

Account object instantiates with a zero balance
account = Account.new
account.deposit(1000)
account.balance
account.deposit(2000)
account.withdrawal(500)
account.balance
account.print_statement


### Usage instructions

Clone the project and then cd into it

bundle install

example usage in pry or irb

```

[1] pry(main)> require './lib/account.rb'
=> true
[2] pry(main)> account = Account.new
=> #<Account:0x00007f8a8c0dae80 @balance=0, @cashflows=[]>
[3] pry(main)> account.deposit(1000)
=> [{:date=>2018-10-09 11:44:12 +0100, :credit=>1000, :debit=>nil, :balance=>1000}]
[4] pry(main)> account.deposit(2000)
=> [{:date=>2018-10-09 11:44:12 +0100, :credit=>1000, :debit=>nil, :balance=>1000},
 {:date=>2018-10-09 11:44:17 +0100, :credit=>2000, :debit=>nil, :balance=>3000}]
[5] pry(main)> account.withdraw(500)
=> [{:date=>2018-10-09 11:44:12 +0100, :credit=>1000, :debit=>nil, :balance=>1000},
 {:date=>2018-10-09 11:44:17 +0100, :credit=>2000, :debit=>nil, :balance=>3000},
 {:date=>2018-10-09 11:44:24 +0100, :credit=>nil, :debit=>500, :balance=>2500}]
[6] pry(main)> account.statement
date || credit || debit || balance
09/10/2018 ||  || 500.00 || 2500.00
09/10/2018 || 2000.00 ||  || 3000.00
09/10/2018 || 1000.00 ||  || 1000.00
=> [{:date=>2018-10-09 11:44:12 +0100, :credit=>1000, :debit=>nil, :balance=>1000},
 {:date=>2018-10-09 11:44:17 +0100, :credit=>2000, :debit=>nil, :balance=>3000},
 {:date=>2018-10-09 11:44:24 +0100, :credit=>nil, :debit=>500, :balance=>2500}]

 ```

To see test coverage run Rspec in the command line


```
➜  bank-tech-test git:(master) ✗ rspec

Account
  #initialize
    initializes a new account with a zero balance
  #deposit
    adds money to the account balance
    only accepts integer values as argument
    only accepts positive numbers
    creates a record of the cashflow with date and resulting balance
  #withdrawal
    changes the balance by the amount
    only accepts integer values as argument
    only accepts positive numbers
    will not allow withdrawals larger than the current balance
    creates a record of the cashflow with date and resulting balance
  #statement
    prints out a statement of cashflows to the screen with amount, date and balance

User Stories
  so I can manage my finances, I want to open an account
  so I can build my savings, I want to make a deposit
  so I can see how much money I have, I want to check the balance
  so I can access my money, I want to make a withdrawal
date || credit || debit || balance
09/10/2018 ||  || 500.00 || 2500.00
09/10/2018 || 2000.00 ||  || 3000.00
09/10/2018 || 1000.00 ||  || 1000.00
  so I can check my cashflows, I want to request a bank statement

Finished in 0.0187 seconds (files took 0.16866 seconds to load)
16 examples, 0 failures


COVERAGE: 100.00% -- 89/89 lines in 3 files

```


Project file structure

```
.
├── Gemfile
├── Gemfile.lock
├── coverage
├── docs
│   ├── CRC_Cards.md
│   ├── PROCESS_UPDATE.md
│   ├── README.md
│   └── User_stories.md
├── lib
│   └── account.rb
└── spec
    ├── account_spec.rb
    ├── features
    │   └── user_stories_spec.rb
    └── spec_helper.rb

```

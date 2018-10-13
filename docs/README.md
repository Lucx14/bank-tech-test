# Bank Tech Test

[![Build Status](https://travis-ci.com/Lucx14/bank-tech-test.svg?branch=master)](https://travis-ci.com/Lucx14/bank-tech-test)

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

➜  bank-tech-test git:(master) ✗ pry
[1] pry(main)> require './lib/account.rb'
=> true
[2] pry(main)> account = Account.new
=> #<Account:0x00007f947da76318 @balance=0, @cashflows=[], @printer=Printer, @transaction=Transaction>
[3] pry(main)> account.deposit(1000)
=> [#<Transaction:0x00007f947d99dc20 @balance=1000, @credit=1000, @date=2018-10-13 20:16:26 +0100>]
[4] pry(main)> account.deposit(2000)
=> [#<Transaction:0x00007f947d99dc20 @balance=1000, @credit=1000, @date=2018-10-13 20:16:26 +0100>,
 #<Transaction:0x00007f947d9462e0 @balance=3000, @credit=2000, @date=2018-10-13 20:16:34 +0100>]
[5] pry(main)> account.withdraw(500)
=> [#<Transaction:0x00007f947d99dc20 @balance=1000, @credit=1000, @date=2018-10-13 20:16:26 +0100>,
 #<Transaction:0x00007f947d9462e0 @balance=3000, @credit=2000, @date=2018-10-13 20:16:34 +0100>,
 #<Transaction:0x00007f947f09b0f8 @balance=2500, @date=2018-10-13 20:16:38 +0100, @debit=500>]
[6] pry(main)> account.statement
date || credit || debit || balance
 13/10/2018 ||  || 500.00 || 2500.00
 13/10/2018 || 2000.00 ||  || 3000.00
 13/10/2018 || 1000.00 ||  || 1000.00
=> nil

```

To see test coverage run Rspec in the command line


```
Account
  #deposit
    creates a new Transaction object
    adds money to the account balance
    only accepts integer values as argument
    only accepts positive numbers
  #withdrawal
    creates a new Transaction object
    changes the balance by the amount
    only accepts integer values as argument
    only accepts positive numbers
    will not allow withdrawals larger than the current balance
  #statement
    printer can receive print_statement

User Stories
  so I can build my savings, I want to make a deposit
  so I can see how much money I have, I want to check the balance
  so I can access my money, I want to make a withdrawal
  so I can check my cashflows, I want to request a bank statement

Printer
  #headers
    prints a formatted headers string
  #print_transactions
    will output a formatted bank statement
  #print_statement
    prints a formatted bank statement

Transaction
  #date
    can read the date attribute
  #credt
    can read the credit attribute
  #debit
    can read the debit attribute
  #balance
    can read the balance attribute
  #initialize
    can correctly determine debit or credit

Finished in 0.01355 seconds (files took 0.15405 seconds to load)
22 examples, 0 failures


COVERAGE: 100.00% -- 145/145 lines in 7 files

➜  bank-tech-test git:(master) ✗ rubocop
Inspecting 10 files
..........

10 files inspected, no offenses detected



```


Project file structure

```
.
├── Gemfile
├── Gemfile.lock
├── Rakefile
├── coverage
├── docs
│   ├── CRC_Cards.md
│   ├── PROCESS_UPDATE.md
│   ├── README.md
│   └── User_stories.md
├── lib
│   ├── account.rb
│   ├── printer.rb
│   └── transaction.rb
└── spec
    ├── account_spec.rb
    ├── features
    │   └── user_stories_spec.rb
    ├── printer_spec.rb
    ├── spec_helper.rb
    └── transaction_spec.rb

```

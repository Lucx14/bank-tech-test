require './lib/printer.rb'

class Account
  include Printer

  attr_reader :balance, :cashflows

  def initialize
    @balance = 0
    @cashflows = []
  end

  def deposit(amount)
    raise 'Error: amount must be entered as an integer' unless integer?(amount)
    raise 'Error: amount must be positive' unless positive?(amount)

    @balance += amount

    @cashflows << { date: Time.now,
                    credit: amount,
                    debit: nil,
                    balance: @balance }

  end

  def withdraw(amount)
    raise 'Error: amount must be entered as an integer' unless integer?(amount)
    raise 'Error: amount must be positive' unless positive?(amount)
    raise 'Error: not enough money in account' if amount > balance

    @balance -= amount

    @cashflows << { date: Time.now,
                    credit: nil,
                    debit: amount,
                    balance: @balance }

  end

  def statement
    puts headers
    puts print_transactions(@cashflows)
  end

  private

  def integer?(amount)
    amount.is_a? Integer
  end

  def positive?(amount)
    amount > 0
  end

end

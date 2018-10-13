require_relative './printer'

class Account

  attr_reader :balance, :cashflows, :printer

  def initialize(printer = Printer)
    @balance = 0
    @cashflows = []
    @printer = printer
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
    printer.print_statement(@cashflows)
  end

  private

  def integer?(amount)
    amount.is_a? Integer
  end

  def positive?(amount)
    amount.positive?
  end

end

require_relative './printer'
require_relative './transaction'

class Account

  attr_reader :balance, :cashflows, :printer

  def initialize(printer = Printer, transaction = Transaction)
    @balance = 0
    @cashflows = []
    @printer = printer
    @transaction = transaction
  end

  def deposit(amount)
    raise 'Error: amount must be entered as an integer' unless integer?(amount)
    raise 'Error: amount must be positive' unless positive?(amount)

    create_and_store_transaction(amount)
  end

  def withdraw(amount)
    raise 'Error: amount must be entered as an integer' unless integer?(amount)
    raise 'Error: amount must be positive' unless positive?(amount)
    raise 'Error: not enough money in account' if amount > balance

    create_and_store_transaction(-amount)
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

  def create_and_store_transaction(amount)
    @balance += amount
    @cashflows << @transaction.new(balance: @balance, cash_value: amount)
  end

end

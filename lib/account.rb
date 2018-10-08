class Account

  attr_reader :balance, :cashflows

  def initialize
    @balance = 0
    @cashflows = []
  end

  def deposit(amount)
    raise 'Error: amount must be entered as an integer' unless integer?(amount)
    raise 'Error: amount must be positive' unless positive?(amount)

    @balance += amount
    date = Time.now
    credit = amount
    cashflow = { date: date, credit: credit, debit: nil, balance: @balance }

    @cashflows << cashflow

  end

  def withdraw(amount)
    raise 'Error: amount must be entered as an integer' unless integer?(amount)
    raise 'Error: amount must be positive' unless positive?(amount)
    raise 'Error: not enough money in account' if amount > balance

    @balance -= amount
  end

  def statement
  end

  private

  def integer?(amount)
    amount.is_a? Integer
  end

  def positive?(amount)
    amount > 0
  end

end

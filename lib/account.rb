class Account

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    raise 'Error: amount must be entered as an integer' unless integer?(amount)
    raise 'Error: amount must be positive' unless positive?(amount)

    @balance += amount
  end

  def withdraw(amount)
    raise 'Error: amount must be entered as an integer' unless integer?(amount)
    raise 'Error: amount must be positive' unless positive?(amount)

    @balance -= amount
  end

  private

  def integer?(amount)
    amount.is_a? Integer
  end

  def positive?(amount)
    amount > 0
  end

end

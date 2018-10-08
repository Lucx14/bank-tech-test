class Account

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    raise 'Error: amount must be entered as an integer' unless integer?(amount)

    @balance += amount
  end

  def withdraw(amount)
    raise 'Error: amount must be entered as an integer' unless integer?(amount)

    @balance -= amount
  end

  private

  def integer?(amount)
    amount.is_a? Integer
  end

end

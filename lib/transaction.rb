class Transaction

  attr_reader :balance, :date, :credit, :debit

  def initialize(balance:, cash_value:)
    @date = Time.now
    @balance = balance
    credit_debit(cash_value)
  end

  private

  def credit_debit(cash_value)
    cash_value.positive? ? @credit = cash_value : @debit = cash_value.abs
  end

end

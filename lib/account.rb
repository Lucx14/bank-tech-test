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
    statement_headers
    cashflows.reverse_each do |cashflow|
      puts "#{date_format(cashflow[:date])} || #{decimalize(cashflow[:credit])} || #{decimalize(cashflow[:debit])} || #{decimalize(cashflow[:balance])}"
    end
  end

  private

  def integer?(amount)
    amount.is_a? Integer
  end

  def positive?(amount)
    amount > 0
  end

  def statement_headers
    headers = [:date, :credit, :debit, :balance]
    puts headers.join(" || ")
  end

  def decimalize(input)
    "%.2f" % input.to_f unless input.nil?
  end

  def date_format(date)
    date.strftime("%d/%m/%Y")
  end

end

module Printer

  STATEMENT_HEADERS = [:date, :credit, :debit, :balance]

  def self.headers
    STATEMENT_HEADERS.join(" || ") + "\n"
  end

  def self.print_transactions(cashflows)
    cashflows.reverse.map do |cashflow|
      " #{date_format(cashflow[:date])} ||"\
      " #{decimalize(cashflow[:credit])} ||"\
      " #{decimalize(cashflow[:debit])} ||"\
      " #{decimalize(cashflow[:balance])} "
    end.join("\n")
  end

  def self.print_statement(cashflows)
    puts headers + print_transactions(cashflows)
  end

  def self.date_format(date)
    date.strftime("%d/%m/%Y")
  end

  def self.decimalize(input)
    "%.2f" % input.to_f unless input.nil?
  end

  private_class_method :date_format, :decimalize

end

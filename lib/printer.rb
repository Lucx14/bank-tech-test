module Printer

  STATEMENT_HEADERS = [:date, :credit, :debit, :balance]

  def headers
    STATEMENT_HEADERS.join(" || ")
  end

  def print_transactions(cashflows)
    cashflows.reverse.map do |cashflow|
      " #{date_format(cashflow[:date])} ||"\
      " #{decimalize(cashflow[:credit])} ||"\
      " #{decimalize(cashflow[:debit])} ||"\
      " #{decimalize(cashflow[:balance])} "
    end.join("\n")
  end

  private

  def date_format(date)
    date.strftime("%d/%m/%Y")
  end

  def decimalize(input)
    "%.2f" % input.to_f unless input.nil?
  end

end

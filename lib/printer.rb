class Printer

STATEMENT_HEADERS = [:date, :credit, :debit, :balance]



  def headers
    STATEMENT_HEADERS.join(" || ")
  end


end

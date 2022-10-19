class SetTypeTransaction
  def initialize(line)
    @line = line
  end

  def execute
    case @line[0..0].to_i
    when 1
      "debit"
    when 2
      "billet"
    when 3
      "financing"
    when 4
      "credit"
    when 5
      "loan_receipt"
    when 6
      "sales"
    when 7
      "ted_receipt"
    when 8
      "doc_receipt"
    when 9
      "rent"
    else
      "debit"
    end
  end
end
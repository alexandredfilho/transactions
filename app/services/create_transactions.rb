class CreateTransactions
  def initialize(parsed_data)
    @parsed_data = parsed_data
  end

  def errors
    @fetch_errors
  end

  def execute
    CnabTransaction.transaction do
      begin
        CnabTransaction.create!(@parsed_data)
      rescue ActiveRecord::RecordInvalid => e
        @fetch_errors << e
        raise ActiveRecord::Rollback
      end
    end
  end
end
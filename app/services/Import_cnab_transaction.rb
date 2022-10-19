class ImportCnabTransaction
  attr_accessor :file, :path, :fetch_errors

  def initialize(path)
    @path = path
    @fetch_errors = []
  end

  def execute
    parse_data
    create_transactions
  end

  def parse_data
    file = File.open(@path.to_s)

    @parsed_data = file.readlines.map do |line|
      {
        type_transaction: type_transaction(line),
        date_transaction: date_transaction(line),
        value: value(line),
        cpf: cpf(line),
        card_number: card_number(line),
        hour_transaction: hour_transaction(line),
        store_id: store(line),
      }
    end
  end

  def errors
    @fetch_errors
  end

  def create_transactions
    CreateTransactions.new(@parsed_data).execute
  end

  def type_transaction(line)
    SetTypeTransaction.new(line).execute
  end

  def date_transaction(line)
    line[1..8].to_date
  end

  def value(line)
    line[9..18].to_f / 100
  end

  def cpf(line)
    line[19..29]
  end

  def card_number(line)
    line[30..41]
  end

  def hour_transaction(line)
    Time.at(line[42..47].to_i).strftime("%H:%M")
  end

  def store_owner(line)
    line[48..61]
  end

  def store_name(line)
    line[62..80].strip
  end

  def store(line)
    store = ::Store.find_by_name(store_name(line).to_s)
    return store.id if store.present?
    return ::Store.create!(name: store_name(line).to_s, store_admin: store_owner(line).to_s).id
  end
end

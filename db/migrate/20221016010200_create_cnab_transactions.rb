class CreateCnabTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :cnab_transactions do |t|
      t.integer :type_transaction, default: 1
      t.date :date_transaction
      t.float :value, :decimal, :precision => 8, :scale => 2
      t.string :cpf
      t.string :card_number
      t.time :hour_transaction

      t.timestamps
    end
  end
end

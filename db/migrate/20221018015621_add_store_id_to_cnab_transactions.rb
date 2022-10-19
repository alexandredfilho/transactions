class AddStoreIdToCnabTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :cnab_transactions, :store, null: false, foreign_key: true
  end
end

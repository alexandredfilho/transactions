class Store < ApplicationRecord
  has_many :cnab_transactions
  validates :name, :store_admin, presence: true
end

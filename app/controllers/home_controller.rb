class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @imported_stores = Store.all
    @imported_transactions = CnabTransaction.all
  end
end

class CnabTransactionsController < ApplicationController
  def index
    @transactions = CnabTransaction.all.order('created_at DESC')
  end

  def new
    @transaction = CnabTransaction.new
  end

  def create
    @transaction =
    file = cnab_transaction_params[:file].tempfile
    import_transaction = ::ImportCnabTransaction.new(file.path)
    import_transaction.execute

    if import_transaction.errors.any?
      flash[:notice] = "Error to process the file: #{import_transaction.errors.join(', ')}"
      redirect_to :new
    else
      flash[:notice] = "File was successfully imported"
      redirect_to stores_path
    end
  end

  private

  def cnab_transaction_params
    params.require(:cnab_transaction).permit(:file)
  end
end

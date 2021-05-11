module TransactionsHelper
  def transaction_group
    if @transactions
      render 'shared/image'
    else
      render 'shared/small_text'
    end
  end
end

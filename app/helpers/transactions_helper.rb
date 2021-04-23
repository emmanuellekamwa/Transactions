module TransactionsHelper
    def transaction_group
        if transaction.group
            render "shared/image"
        else
            render "shared/small_text"
        end
    end
end

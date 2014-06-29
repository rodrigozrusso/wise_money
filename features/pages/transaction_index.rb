require_relative 'crud_index'

module Pages
  class TransactionIndex < Pages::CrudIndex

    set_url 'transactions'
    set_url_matcher /transactions/

    def map_models(transactions)
    end

    def map_model_to_delete(transaction)
    end

  end
end

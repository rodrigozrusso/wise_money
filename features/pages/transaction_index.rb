require_relative 'crud_index'

module Pages
  class TransactionIndex < Pages::CrudIndex

    set_url 'transactions'
    set_url_matcher /transactions/

    def map_models(transactions)
      transactions.map{|t| [t.id.to_s, t.description, t.status_humanize, t.total.to_s, t.checked_at.strftime('%Y-%m-%d'), t.income_capital.to_s, t.expense_capital.to_s]}
    end

    def map_model_to_delete(t)
      "#{t.id} - #{t.description} - #{t.status_humanize} - #{t.total} - #{t.checked_at.strftime('%Y-%m-%d')} - #{t.income_capital} - #{t.expense_capital}"
    end

  end
end

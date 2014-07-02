module Pages
  module Sections
    class TransactionForm < Pages::Sections::CrudForm

      def fill(transaction)
        field_inputs[0].set transaction ? transaction.description : ''
        field_inputs[1].set transaction ? transaction.total : ''
        field_inputs[2].set transaction ? transaction.checked_at.strftime('%d/%m/%Y') : ''
        field_selects[0].find("option[value=\"#{transaction ? transaction.status : ''}\"]").select_option
        field_selects[1].find("option[value=\"#{transaction && transaction.income_capital ? transaction.income_capital.id : ''}\"]").select_option
        field_selects[2].find("option[value=\"#{transaction && transaction.expense_capital ? transaction.expense_capital.id : ''}\"]").select_option
      end

      def map_model(transaction)
        [
          transaction.description,
          transaction.total.to_s,
          transaction.checked_at.strftime('%d/%m/%Y'),
          transaction.status_humanize,
          transaction.income_capital ? transaction.income_capital.to_s : '',
          transaction.expense_capital ? transaction.expense_capital.to_s : ''
        ]
      end

    end
  end
end

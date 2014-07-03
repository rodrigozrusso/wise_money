module Pages
  module Sections
    class TransactionForm < Pages::Sections::CrudForm

      def fill(t)
        field_inputs[0].set t ? t.description : ''
        field_inputs[1].set t ? t.total : ''
        field_inputs[2].set t ? t.checked_at : ''
        select_by_value(field_selects[0], t ? t.status : '')
        select_by_value(field_selects[1], t && t.income_capital ? t.income_capital.id : '')
        select_by_value(field_selects[2], t && t.expense_capital ? t.expense_capital.id : '')
      end

      def map_model(t)
        [
          t.description,
          t.total.to_s,
          t.checked_at.strftime('%d/%m/%Y'),
          t.status_humanize,
          t.income_capital ? t.income_capital.to_s : '',
          t.expense_capital ? t.expense_capital.to_s : ''
        ]
      end

    end
  end
end

Fabricator(:transaction) do
end

Fabricator(:valid_transaction, from: :transaction) do
  description { sequence(:description) { |i| "#{Forgery::Application.transaction_description}-#{i}" } }
  status { TransactionStatus.list.sample }
  total { Forgery(:monetary).money(min: -100.0, max: 1000.0) }
  checked_at { Forgery(:basic).number(at_least: 1, at_most: 30).days.ago }
  income_capital { Capital.all.sample }
  expense_capital { Capital.all.sample }
end

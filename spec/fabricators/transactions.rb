Fabricator(:transaction) do
end

Fabricator(:transaction_valid, from: :transaction) do
  description { sequence(:description) { |i| "#{Forgery::Application.transaction_description}-#{i}" } }
  status { TransactionStatus.list.sample }
  total { Forgery(:monetary).money(min: -100.0, max: 1000.0) }
  checked_at { Forgery(:basic).number(at_least: 1, at_most: 30).days.ago }
end

Fabricator(:transaction_with_income, from: :transaction_valid) do
  income_capital { Fabricate(:capital_valid) }
end
Fabricator(:transaction_with_expense, from: :transaction_valid) do
  expense_capital { Fabricate(:capital_valid) }
end
Fabricator(:transaction_with_income_and_expense, from: :transaction_with_income) do
  expense_capital { Fabricate(:capital_valid) }
end

Fabricator(:transaction_light_bill, from: :transaction_valid) do
  description 'light bill'
  status { TransactionStatus.list[0] }
  total 100.99
  checked_at Date.new(2014,6,23)
  income_capital { Fabricate(:capital_saving_account) }
end

Fabricator(:transaction_maximum_lenght, from: :transaction_valid) do
  description 'a' * 151
end

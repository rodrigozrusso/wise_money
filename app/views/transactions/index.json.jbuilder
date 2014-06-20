json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :description, :status_humanize, :total, :checked_at, :income_capital_id, :expense_capital_id
  json.url transaction_url(transaction, format: :json)
end

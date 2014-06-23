Fabricator(:capital) do
end

Fabricator(:capital_valid, from: :capital) do
  name { sequence(:name) { |i| "#{Forgery::Application.capital_name}-#{i}" } }
end

Fabricator(:capital_saving_account, from: :capital_valid) do
  name 'saving account'
end

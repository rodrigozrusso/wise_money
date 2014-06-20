Fabricator(:capital) do
end

Fabricator(:valid_capital, from: :capital) do
  name { sequence(:name) { |i| "#{Forgery::Application.capital_name}-#{i}" } }
end

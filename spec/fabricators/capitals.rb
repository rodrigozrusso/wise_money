Fabricator(:capital) do
end

Fabricator(:capital_valid, from: :capital) do
  name { sequence(:name) { |i| "#{Forgery::Application.capital_name}-#{i}" } }
end

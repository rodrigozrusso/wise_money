json.array!(@capitals) do |capital|
  json.extract! capital, :id, :name
  json.url capital_url(capital, format: :json)
end

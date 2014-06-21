Quando(/^eu chamo o servico de healthcheck$/) do
  @service = Service::Healthcheck.new
  @service.healthcheck
end

Entao(/^o response deve conter "(.*?)"$/) do |msg|
  expect(@service.response).to include(msg)
end

Entao(/^o response deve ter http code (\d+)$/) do |code|
  expect(@service.code).to eq(code.to_i)
end

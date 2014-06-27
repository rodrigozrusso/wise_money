When(/^I call the healthcheck service$/) do
  @service = Service::Healthcheck.new.healthcheck
end

Then(/^the result should be '(.*?)'$/) do |msg|
  expect(@service.response).to eq(msg)
end

Then(/^the http code should be (\d+)$/) do |code|
  expect(@service.code).to eq(code.to_i)
end

Quando(/^eu chamo o servico de healthcheck$/) do
  @service = Service::Healthcheck.new
  @service.healthcheck
end

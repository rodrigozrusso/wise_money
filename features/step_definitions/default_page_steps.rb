Dado(/^acesso "(.*?)"$/) do |page|
  @page = "Pages::#{page}".constantize.new.load
end
Dado(/^exista (\d+ )?"(.*?)" e acesso "(.*?)"$/) do |count, fabricators, page|
  count ||= 1
  @models = fabricators.split(',').map{|f| Fabricate.times(count.to_i, f.to_sym)}.flatten
  @page = "Pages::#{page}".constantize.new.load
end
Dado(/^exista (\d+ )?"(.*?)" e acesso "(.*?)" pelo id$/) do |count, fabricators, page|
  count ||= 1
  @models = fabricators.split(',').map{|f| Fabricate.times(count.to_i, f.to_sym)}.flatten
  @page = "Pages::#{page}".constantize.new.load(id: @models.last.id)
end

Quando(/^clico no botao "(.*?)" (\d+)$/) do |button, i|
  all(:link_or_button, text: button)[i.to_i - 1].click
end
Quando(/^clico no botao "(.*?)" e vou para "(.*?)"$/) do |button, page|
  click_on(button)
  @page = "Pages::#{page}".constantize.new
  expect(@page.displayed?).to be true
end
Quando(/^clico no botao "(.*?)" (\d+) e vou para "(.*?)"$/) do |button, i, page|
  all(:link_or_button, text: button)[i.to_i - 1].click
  @page = "Pages::#{page}".constantize.new
  expect(@page.displayed?).to be true
end

Entao(/^vejo a mensagem de sucesso "(.*?)"$/) do |msg|
  expect(@page.success_message.text[2..-1]).to eq(msg)
end
Entao(/^vejo a mensagem de alerta "(.*?)"$/) do |msg|
  expect(@page.warning_message.text[2..-1]).to eq(msg)
end
Entao(/^vejo a mensagem de erro "(.*?)"$/) do |msg|
  expect(@page.error_message.text[2..-1]).to eq(msg)
end

Entao(/^a pagina tem titulo "(.*?)"$/) do |title|
  expect(@page.page_title.text).to eq(title)
  expect(@page.title).to eq('WiseMoney')
end

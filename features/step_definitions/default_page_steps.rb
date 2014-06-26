Dado(/^exista (\d+ )?"(.*?)"$/) do |count, fabricators|
  count ||= 1
  @models = fabricators.split(',').map{|f| Fabricate.times(count.to_i, f.to_sym)}.flatten
end

Dado(/^acesso "(.*?)"$/) do |page|
  @page = "Pages::#{page}".constantize.new.load
end
Dado(/^acesso "(.*?)" pelo id$/) do |page|
  @page = "Pages::#{page}".constantize.new.load(id: @models.last.id)
end

Quando(/^clico no botao "(.*?)"$/) do |button|
  click_on(button)
end
Quando(/^clico no botao "(.*?)" (\d+)$/) do |button, i|
  all(:link_or_button, text: button)[i.to_i - 1].click
end

Entao(/^vou para "(.*?)"$/) do |page|
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
  expect(@page.error_message.text).to eq(msg)
end
Entao(/^vejo as mensagens de validacao "(.*?)"$/) do |msgs|
  expect(@page.form.validation_messages).to eq(msgs.split('|'))
end

Entao(/^a pagina tem titulo "(.*?)"$/) do |title|
  expect(@page.page_title.text).to eq(title)
  expect(@page.title).to eq('WiseMoney')
end

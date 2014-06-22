Dado(/^que nao exista nenhum "(.*?)"$/) do |model|
  model.constantize.all { |m| m.delete }
end
Dado(/^que exista apenas (\d+) "(.*?)" do tipo "(.*?)"$/) do |count, model, fabricator|
  model.constantize.all { |m| m.delete }
  @models = Fabricate.times(count.to_i, fabricator.to_sym)
end

Quando(/^acesso "(.*?)"$/) do |page|
  @page = "Pages::#{page}".constantize.new.load
end
Quando(/^acesso "(.*?)" pelo id do ultimo$/) do |page|
  @page = "Pages::#{page}".constantize.new.load(id: @models.last.id)
end

Quando(/^clico no botao "(.*?)"$/) do |button|
  click_on(button)
end
Quando(/^clico no botao (\d+) "(.*?)"$/) do |i, button|
  find(:link_or_button, text: button).click
end

Entao(/^estou em "(.*?)"$/) do |page|
  page = "Pages::#{page}".constantize.new
  expect(page.displayed?).to be true
  @page = page
end

Entao(/^vejo a mensagem de sucesso "(.*?)"$/) do |msg|
  expect(@page.success_message.text[2..-1]).to eq(msg)
end

Entao(/^a pagina tem titulo "(.*?)"$/) do |title|
  expect(@page.page_title.text).to eq(title)
  expect(@page.title).to eq('WiseMoney')
end

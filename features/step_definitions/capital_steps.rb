Dado(/^que nao exista nenhum capital$/) do
  Capital.all { |m| m.delete }
end

Dado(/^que exista (\d+) capita(l|is)$/) do |count, arg1|
  Capital.all { |m| m.delete }
  @models = Fabricate.times(count.to_i, :capital_valid)
end

Quando(/^clico no botao "(.*?)"$/) do |button|
  click_on(button)
end
Quando(/^clico no botao (\d+) "(.*?)"$/) do |i, button|
  find(:link_or_button, text: button).click
end

Entao(/^devo ver a mensagem de sucesso "(.*?)"$/) do |msg|
  expect(@page.success_message.text[2..-1]).to eq(msg)
end

Entao(/^a pagina tem titulo "(.*?)"$/) do |title|
  expect(@page.page_title.text).to eq(title)
  expect(@page.title).to eq('WiseMoney')
end

Entao(/^a pagina tem resultados$/) do
  expect(@page.has_no_results?).to be false
end
Entao(/^a pagina nao tem resultados "(.*?)"$/) do |msg|
  expect(@page.no_results.text).to eq(msg)
end

Entao(/^a pagina tem as colunas "(.*?)"$/) do |columns|
  expect(@page.table_headers.map { |h| h.text }).to eq(columns.split('|'))
end

Entao(/^a pagina tem as capita(l|is) criada[s]$/) do |arg1|
  actual = @page.capitals.map{|c| c.all('td')[0..-4].map{|t| t.text} }
  expect(actual).to eq(@models.map{|c| [c.id.to_s, c.name]})
end
Entao(/^a pagina tem os detalhes da capital (\d+)$/) do |i|
  actual = @page.form.fields.map{|f| f.value }
  expect(actual).to eq([@models[i.to_i - 1].name])
end

Entao(/^o modal de remocao abre$/) do
  expect(@page.delete_modal.title.text).to be
end
Entao(/^o modal tem no titulo "(.*?)"$/) do |title|
  expect(@page.delete_modal.title.text).to eq(title)
end
Entao(/^o modal tem no conteudo o capital criado (\d+)$/) do |i|
  capital = @models[i.to_i - 1]
  expect(@page.delete_modal.body.text).to eq("#{capital.id} - #{capital.name}")
end

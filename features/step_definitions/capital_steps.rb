Dado(/^que nao exista nenhum capital$/) do
  Capital.all { |m| m.delete }
end

Quando(/^acesso a listagem de capital$/) do
  @page = CapitalIndex.new
  @page.load
end

Quando(/^clico no botao novo$/) do
  @page.new_button.click
end

Entao(/^devo estar na listagem de capital$/) do
  expect(CapitalIndex.new.displayed?).to be true
end
Entao(/^devo estar na criacao de capital$/) do
  expect(CapitalNew.new.displayed?).to be true
end

Entao(/^a pagina tem as colunas "(.*?)"$/) do |columns|
  expect(@page.table_headers.map { |h| h.text }).to eq(columns.split('|'))
end

Entao(/^a pagina nao tem resultados "(.*?)"$/) do |msg|
  expect(@page.no_results.text).to eq(msg)
end

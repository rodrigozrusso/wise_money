Entao(/^a pagina tem resultados$/) do
  expect(@page.has_no_results?).to be false
end
Entao(/^a pagina nao tem resultados "(.*?)"$/) do |msg|
  expect(@page.no_results.text).to eq(msg)
end

Entao(/^a pagina tem as colunas "(.*?)"$/) do |columns|
  expect(@page.table_headers.map { |h| h.text }).to eq(columns.split('|'))
end

Entao(/^o modal de remocao abre$/) do
  expect(@page.delete_modal.title.text).to be
end
Entao(/^o modal de remocao tem titulo "(.*?)"$/) do |title|
  expect(@page.delete_modal.title.text).to eq(title)
end

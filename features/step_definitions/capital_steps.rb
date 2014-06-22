Entao(/^a pagina tem as capita(l|is) criada[s]$/) do |arg1|
  actual = @page.capitals.map{|c| c.all('td')[0..-4].map{|t| t.text} }
  expect(actual).to eq(@models.map{|c| [c.id.to_s, c.name]})
end

Entao(/^a pagina tem os detalhes da capital (\d+)$/) do |i|
  actual = @page.form.fields.map{|f| f.value }
  expect(actual).to eq([@models[i.to_i - 1].name])
end

Entao(/^o modal tem no conteudo o capital criado (\d+)$/) do |i|
  capital = @models[i.to_i - 1]
  expect(@page.delete_modal.body.text).to eq("#{capital.id} - #{capital.name}")
end

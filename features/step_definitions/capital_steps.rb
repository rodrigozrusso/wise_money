Entao(/^a pagina lista os capitais criadas$/) do
  actual = @page.capitals.map{|c| c.all('td')[0..-4].map{|t| t.text} }
  expect(actual).to eq(@models.map{|c| [c.id.to_s, c.name]})
end

Entao(/^a pagina detalha o capital (\d+)$/) do |i|
  actual = @page.form.fields.map{|f| f.value }
  expect(actual).to eq([@models[i.to_i - 1].name])
end

Entao(/^o modal de remocao tem o capital criado (\d+)$/) do |i|
  capital = @models[i.to_i - 1]
  expect(@page.delete_modal.body.text).to eq("#{capital.id} - #{capital.name}")
end

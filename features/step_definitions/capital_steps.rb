Quando(/^preencho o formulario com "(.*?)"$/) do |fabricator|
  @models = [Fabricate.build(fabricator.to_sym)]
  @page.form.fill(@models[0])
end
Quando(/^preencho o formulario com modelo criado$/) do
  @page.form.fill(@models.last)
end

Entao(/^a pagina lista os capitais criadas$/) do
  expect(@page.has_no_results?).to be false
  actual = @page.capitals.map{|c| c.all('td')[0..-4].map{|t| t.text} }
  expect(actual).to eq(@models.map{|c| [c.id.to_s, c.name]})
end

Entao(/^a pagina detalha o capital$/) do
  actual = @page.form.fields.map{|f| f.value }
  expect(actual).to eq([@models.last.name])
end

Entao(/^o modal de remocao tem o capital criado (\d+)$/) do |i|
  capital = @models[i.to_i - 1]
  expect(@page.delete_modal.body.text).to eq("#{capital.id} - #{capital.name}")
end

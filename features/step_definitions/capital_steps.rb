Given(/^I fill the form with '(.*?)'$/) do |fabricator|
  @models = fabricator.present? ? [Fabricate.build(fabricator.to_sym)] : []
  @page.form.fill(@models.first)
end

Given(/^I fill the form with the last saved$/) do
  @page.form.fill(@models.last)
end

Then(/^the page should list the saved capitals$/) do
  expect(@page.has_no_results?).to be false
  actual = @page.capitals.map{|c| c.all('td')[0..-4].map{|t| t.text} }
  expect(actual).to eq(@models.map{|c| [c.id.to_s, c.name]})
end

Then(/^the remove modal should show the last saved capital$/) do
  expect(@page.delete_modal.body.text).to eq("#{@models.last.id} - #{@models.last.name}")
end

Then(/^the page should show the last saved capital$/) do
  actual = @page.form.fields.map{|f| f.value }
  expect(actual).to eq([@models.last.name])
end

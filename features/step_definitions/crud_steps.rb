Given(/^there (?:is|are) (\d+ )?'(.*?)'$/) do |count, fabricators|
  count ||= 1
  @models ||= []
  @models << fabricators.split(',').map{|f| count.to_i.times.map { Fabricate.build(f.to_sym) }}
  @models = @models.flatten
end

Given(/^there (?:is|are) (\d+ )?'(.*?)' stored$/) do |count, fabricators|
  count ||= 1
  @models ||= []
  @models << fabricators.split(',').map{|f| Fabricate.times(count.to_i, f.to_sym)}
  @models = @models.flatten
end

Given(/^its '(.*?)' is stored$/) do |field|
  @models.last.send(field.to_sym).save
end

Given(/^I fill the form with '(.*?)'$/) do |fabricator|
  @models = fabricator.present? ? [Fabricate.build(fabricator.to_sym)] : []
  @page.form.fill(@models.last)
end

Given(/^I fill the form with the last$/) do
  @page.form.fill(@models.last)
end

Then(/^the page should has no results with the message '(.*?)'$/) do |msg|
  expect(@page.no_results.text).to eq(msg)
end

Then(/^the page should has columns '(.*?)'$/) do |columns|
  expect(@page.map_columns).to eq(columns.split('|'))
end

Then(/^the page should list all the saved$/) do
  expect(@page.has_no_results?).to be false
  expect(@page.map_items).to eq(@page.map_models(@models))
end

Then(/^the remove modal should be opened$/) do
  expect(@page.delete_modal.title.text).to be
end

Then(/^the remove modal title should be '(.*?)'$/) do |title|
  expect(@page.delete_modal.title.text).to eq(title)
end

Then(/^the remove modal should show the last saved$/) do
  expect(@page.delete_modal.body.text).to eq(@page.map_model_to_delete(@models.last))
end

Then(/^the page should show the last saved$/) do
  expect(@page.form.map_fields).to eq(@page.form.map_model(@models.last))
end

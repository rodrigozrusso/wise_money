Given(/^I fill the form with '(.*?)'$/) do |fabricator|
  @models = fabricator.present? ? [Fabricate.build(fabricator.to_sym)] : []
  @page.form.fill(@models.first)
end

Given(/^I fill the form with the last saved$/) do
  @page.form.fill(@models.last)
end

Then(/^the page should has no results with the message '(.*?)'$/) do |msg|
  expect(@page.no_results.text).to eq(msg)
end

Then(/^the page should has columns '(.*?)'$/) do |columns|
  expect(@page.table_headers.map { |h| h.text }).to eq(columns.split('|'))
end

Then(/^the page should list all the saved$/) do
  expect(@page.has_no_results?).to be false
  expect(@page.map_list).to eq(@page.map_models(@models))
end

Then(/^the remove modal should be opened$/) do
  expect(@page.delete_modal.title.text).to be
end

Then(/^the remove modal title should be '(.*?)'$/) do |title|
  expect(@page.delete_modal.title.text).to eq(title)
end

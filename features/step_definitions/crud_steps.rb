Then(/^the page should has no results with the message '(.*?)'$/) do |msg|
  expect(@page.no_results.text).to eq(msg)
end
Then(/^the page should has columns '(.*?)'$/) do |columns|
  expect(@page.table_headers.map { |h| h.text }).to eq(columns.split('|'))
end

Then(/^the remove modal should be opened$/) do
  expect(@page.delete_modal.title.text).to be
end
Then(/^the remove modal title should be '(.*?)'$/) do |title|
  expect(@page.delete_modal.title.text).to eq(title)
end

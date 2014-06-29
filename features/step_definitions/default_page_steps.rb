Given(/^there (?:is|are) (\d+ )?'(.*?)'$/) do |count, fabricators|
  count ||= 1
  @models = fabricators.split(',').map{|f| Fabricate.times(count.to_i, f.to_sym)}.flatten
end

Given(/^I am at '(.*?)'$/) do |page|
  @page = "Pages::#{page}".constantize.new.load
end

Given(/^I am at '(.*?)' by the last saved$/) do |page|
  @page = "Pages::#{page}".constantize.new.load(id: @models.last.id)
end

When(/^I click button '(.*?)'$/) do |button|
  click_on(button)
end

Then(/^I should be redirected to '(.*?)'$/) do |page|
  @page = "Pages::#{page}".constantize.new
  expect(@page.displayed?).to be true
end

Then(/^the page title should be '(.*?)'$/) do |title|
  expect(@page.page_title.text).to eq(title)
  expect(@page.title).to eq('WiseMoney')
end

Then(/^I can see the (success|warning|error) message '(.*?)'$/) do |type, msg|
  expect(@page.message(type)).to eq(msg)
end

Then(/^I can see the validation message '(.*?)'$/) do |msgs|
  expect(@page.form.validation_messages).to eq(msgs.split('|'))
end

Quando(/^acesso "(.*?)"$/) do |page|
  @page = "Pages::#{page}".constantize.new.load
end
Quando(/^acesso "(.*?)" pelo id do ultimo$/) do |page|
  @page = "Pages::#{page}".constantize.new.load(id: @models.last.id)
end

Entao(/^estou em "(.*?)"$/) do |page|
  expect("Pages::#{page}".constantize.new.displayed?).to be true
end

Dado(/^que nao exista nenhum "(.*?)"$/) do |model|
  model.constantize.all { |m| m.delete }
end
Dado(/^que exista apenas (\d+) "(.*?)" do tipo "(.*?)"$/) do |count, model, fabricator|
  model.constantize.all { |m| m.delete }
  @models = Fabricate.times(count.to_i, fabricator.to_sym)
end

Quando(/^acesso "(.*?)"$/) do |page|
  @page = "Pages::#{page}".constantize.new.load
end
Quando(/^acesso "(.*?)" pelo id do ultimo$/) do |page|
  @page = "Pages::#{page}".constantize.new.load(id: @models.last.id)
end

Entao(/^estou em "(.*?)"$/) do |page|
  expect("Pages::#{page}".constantize.new.displayed?).to be true
end

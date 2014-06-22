Quando(/^acesso a home$/) do
  @page = Pages::Home.new
  @page.load
end

Entao(/^devo estar na home$/) do
  expect(Pages::Home.new.displayed?).to be true
end

Quando(/^clico no menu "(.*?)"$/) do |button|
  @page.menu.find(:link_or_button, text: button).click
end

Quando(/^o menu ativo deve ser "(.*?)"$/) do |button|
  expect(@page.menu.find(:link_or_button, text: button).first(:xpath,".//..")[:class]).to include('active')
end

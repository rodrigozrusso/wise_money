Quando(/^clico no menu "(.*?)"$/) do |button|
  @page.menu.find(:link_or_button, text: button).click
end

Entao(/^o menu ativo deve ser "(.*?)"$/) do |button|
  expect(@page.menu.find(:link_or_button, text: button).first(:xpath,".//..")[:class]).to include('active')
end

Entao(/^o menu tem "(.*?)"$/) do |buttons|
  expect(@page.menu.buttons.map{|b| b.text }).to eq(buttons.split('|'))
end

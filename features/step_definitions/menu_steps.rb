When /^I click at menu '(.*?)'$/ do |menu|
  @page.menu.find_menu(menu).click
end

Then /^the active menu should be '(.*?)'$/ do |menu|
  expect(@page.menu.active_button.text).to eq(menu)
end

Then /^the menu has '(.*?)'$/ do |menus|
  expect(@page.menu.buttons.map{|b| b.text }).to eq(menus.split('|'))
end

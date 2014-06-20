Before do |scenario|
  page.driver.browser.manage.window.maximize if DRIVER == 'selenium'
  page.driver.resize(1280, 800) if DRIVER == 'poltergeist'
end

AfterStep do |scenario|
  page.has_content? ''
end

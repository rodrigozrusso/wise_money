require 'capybara/cucumber'
require File.expand_path('../../../config/environment', __FILE__)

Capybara.app = WiseMoney::Application
Capybara.server_port = "820#{ENV['TEST_ENV_NUMBER'].presence || 0}".to_i

# Drivers definitions
if DRIVER == 'poltergeist'
  require 'capybara/poltergeist'

  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, phantomjs_options: ['--ignore-ssl-errors=yes'], phantomjs_logger: IO::NULL)
  end
else
  require 'selenium/webdriver'

  [:chrome, :firefox, :safari].each do |driver|
    Capybara.register_driver driver do |app|
      Capybara::Selenium::Driver.new(app, browser: driver)
    end
  end
end

Capybara.default_driver = DRIVER.to_sym
Capybara.default_wait_time = 5

if TEST_ENV == :local
  Capybara.run_server = true
  Capybara.app_host = "http://localhost:#{Capybara.server_port}"
else
  Capybara.run_server = false
  Capybara.app_host = ADMIN_URL
end

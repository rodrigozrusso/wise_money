require 'cucumber/rails'
require 'capybara'
require 'capybara/cucumber'
require File.expand_path('../../../config/environment', __FILE__)
require 'site_prism'

def register_drivers(driver)
  if driver == 'poltergeist'
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
  driver
end

def register_capybara(env, driver, host, port)
  Capybara.app = WiseMoney::Application
  Capybara.run_server = env == :local
  Capybara.default_driver = driver.to_sym
  Capybara.app_host = host
  Capybara.server_port = port
  Capybara.default_wait_time = 5

  puts "Capybara driver=#{Capybara.default_driver}"
  puts "Capybara run=#{Capybara.run_server}"
  puts "Capybara host=#{Capybara.app_host}"
end

ActionController::Base.allow_rescue = false

DatabaseCleaner.strategy = :transaction

Cucumber::Rails::Database.javascript_strategy = :truncation

TEST_ENV = !ENV['ENV'].nil? ? ENV['ENV'].to_sym : :local

DRIVER = register_drivers(ENV['DRIVER'] ||'poltergeist')

server_port = "820#{ENV['TEST_ENV_NUMBER'].presence || 0}".to_i

app_urls = {
  local: "http://localhost:#{server_port}/"
}.freeze

APP_URL = ENV['APP_URL'] || app_urls.fetch(TEST_ENV, app_urls[:local])

register_capybara(TEST_ENV, DRIVER, APP_URL, server_port)

require 'cucumber/rails'
require File.expand_path('../../../config/environment', __FILE__)
require 'site_prism'
require_relative 'capybara'

ActionController::Base.allow_rescue = false

TEST_ENV = !ENV['ENV'].nil? ? ENV['ENV'].to_sym : :local

DRIVER = register_drivers(ENV['DRIVER'] ||'poltergeist')

server_port = "820#{ENV['TEST_ENV_NUMBER'].presence || 0}".to_i

app_urls = {
  local: "http://localhost:#{server_port}/"
}.freeze

APP_URL = ENV['APP_URL'] || app_urls.fetch(TEST_ENV, app_urls[:local])

register_capybara(TEST_ENV, DRIVER, APP_URL, server_port)

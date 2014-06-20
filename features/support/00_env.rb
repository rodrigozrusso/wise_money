require 'cucumber/rails'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise 'You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it.'
end

Cucumber::Rails::Database.javascript_strategy = :truncation

application_urls = {
  local: "http://localhost:300#{ENV['TEST_ENV_NUMBER'] || 0}/"
}.freeze

TEST_ENV = !ENV['ENV'].nil? ? ENV['ENV'].to_sym : :local
APPLICATION_URL = ENV['APPLICATION_URL'] || application_urls.fetch(TEST_ENV, application_urls[:local])
DRIVER = ENV['DRIVER'] ||'poltergeist'

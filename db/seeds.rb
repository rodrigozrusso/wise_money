# encoding: UTF-8

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

p "seed capital"
Fabricate.times(15, :valid_capital)

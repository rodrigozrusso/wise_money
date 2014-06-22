# encoding: UTF-8

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

p "seed capital"
Fabricate.times(15, :capital_valid)

p "seed transaction"
Fabricate.times(15, :transaction_valid)

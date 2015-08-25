require 'rubygems'
require 'bundler'

Bundler.setup

require 'huckleberry'
require 'webmock/rspec'
require 'shoulda-matchers'
require 'database_cleaner'
require 'active_record'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

load File.dirname(__FILE__) + "/schema.rb"

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = "random"
  config.fail_fast = true

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before do
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end

require 'rubygems'
require 'bundler'

Bundler.setup

require 'huckleberry'
require 'webmock/rspec'
require 'shoulda-matchers'
require 'database_cleaner'
require 'active_record'
require_relative 'support/database'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  include Database

  db_name = ENV['DB'] || 'postgresql'
  database_yml = File.expand_path("../database.yml", __FILE__)
  ActiveRecord::Base.configurations = YAML.load_file(database_yml)
  db_config = ActiveRecord::Base.configurations[db_name]

  setup_database(db_name, db_config)

  begin
    ActiveRecord::Base.establish_connection(db_name.to_sym)
    ActiveRecord::Base.connection
  rescue PG::ConnectionBad
    ActiveRecord::Base.establish_connection db_config.merge('database' => nil)
    ActiveRecord::Base.connection.create_database db_config['database']
    ActiveRecord::Base.establish_connection db_config
  end

  ActiveRecord::Migration.verbose = false
  load(File.join(File.dirname(__FILE__), 'schema.rb'))

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

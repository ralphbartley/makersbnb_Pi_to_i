ENV['ENVIRONMENT'] = 'test'
ENV['TEST_NAME'] = 'makersbnb_test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require 'setup_test_database'
require 'web_helper.rb'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = Makersbnb

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each) do
    setup_test_database
    con = PG.connect(dbname: ENV['TEST_NAME'])
  end
end

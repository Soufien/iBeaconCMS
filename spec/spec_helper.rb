require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'webmock/rspec'
require 'database_cleaner'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

module Features
  # Extend this module in spec/support/features/*.rb
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :should
  end

  config.fail_fast = true
  config.include Features, type: :feature
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'
  config.use_transactional_fixtures = false

  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

Capybara.javascript_driver = :webkit
WebMock.disable_net_connect!(allow_localhost: true)

source 'https://rubygems.org'

ruby '1.9.3'

gem 'airbrake'
gem 'bourbon'
gem 'coffee-rails'
gem 'delayed_job_active_record', '>= 4.0.0'
gem 'email_validator'
gem 'flutie'
gem 'high_voltage'
gem 'jquery-rails'

gem 'rack-timeout'
gem 'rails', '>= 4.0.0'
gem 'recipient_interceptor'
gem 'sass-rails', '~> 4.0.0'
gem 'simple_form'
gem 'title'
gem 'uglifier'
gem 'unicorn'

#authentication
gem 'devise'

#authorization
gem "cancan"

gem 'bootstrap-sass', '~> 3.1.0'
gem 'haml'

gem 'mysql2'

gem 'turbolinks'

gem 'jbuilder'

gem 'carrierwave'

group :development, :production do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'foreman'
  #gem 'spring'
  #gem 'spring-commands-rspec'
end

group :development, :production, :test do
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '>= 2.14'
end

group :test do
  gem 'capybara-webkit', '>= 1.0.0'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm', '>= 3.6.7'
end

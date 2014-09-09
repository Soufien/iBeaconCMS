source 'https://rubygems.org'

ruby '2.1.2'

gem 'airbrake'
gem 'bourbon'
gem 'coffee-rails'
gem 'delayed_job_active_record', '>= 4.0.0'
gem 'email_validator'
gem 'flutie'
gem 'high_voltage'
gem 'jquery-rails'
gem 'figaro'
gem 'rack-timeout'
gem 'rails', '4.1.0'
gem 'recipient_interceptor'
gem 'sass-rails', '~> 4.0.3'
gem 'simple_form'
gem 'title'
gem 'uglifier'
gem 'unicorn'

#authentication
gem 'devise'

#authorization
gem "cancan"

#http request logger
gem 'http_logger'

gem 'bootstrap-sass', '~> 3.1.0'
gem 'haml'

gem 'mysql2'

gem 'turbolinks'

gem 'jbuilder'

gem 'carrierwave'
gem 'carrierwave_direct'
gem 's3_direct_upload'

gem 'nokogiri', '~>1.5.0'

gem 'fog', '~> 1.3.1'


group :development do
  gem 'foreman'
end

group :production do
  gem 'puma'
end

group :development, :production do
  gem 'better_errors'
  gem 'binding_of_caller'
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
  gem 'simplecov'
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'rails_12factor'
end

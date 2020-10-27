# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Use Puma as the app server
gem 'puma', '3.11'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '6.0.3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # RSpec testing framework to Ruby on Rails
  gem 'rspec-rails', '~> 4.0.1'
  # Code style checking and code formatting tool.
  gem 'rubocop', '~> 1.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Record test suite's HTTP interactions
  gem 'vcr', '~> 6.0'
  # Library for stubbing and setting expectations on HTTP requests
  gem 'webmock' 
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

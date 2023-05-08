# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.4'

gem 'bootsnap', require: false
gem 'devise'
gem 'importmap-rails'
gem 'jbuilder'
gem 'oj'
gem 'pg'
gem 'postmark-rails'
gem 'puma'
gem 'rails_ping'
gem 'redis'
gem 'slim'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec'
  gem 'rspec-its'
  gem 'rspec-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'hotwire-livereload'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'web-console'
  gem 'foreman'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'webdrivers'
end

gem "dockerfile-rails", ">= 1.2", :group => :development

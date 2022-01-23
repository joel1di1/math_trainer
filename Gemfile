# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'administrate'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'jbuilder'
gem 'net-smtp', require: false
gem 'oj'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma'
gem 'rails', '~> 6.0.3'
gem 'sass-rails', '>= 6'
gem 'slim'
gem 'turbolinks'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec'
  gem 'rspec-its'
  gem 'rspec-rails'
  gem 'rubocop-rspec'
  gem 'slim-rails'
  gem 'spring-commands-rspec'
end

group :development do
  gem 'listen'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'webdrivers'
end

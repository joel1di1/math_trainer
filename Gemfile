# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'administrate'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'jbuilder'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma'
gem 'rails', '~> 6.0.3'
gem 'sass-rails'
gem 'slim'
gem 'turbolinks'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec'
  gem 'rspec-rails'
  gem 'slim-rails'
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
  gem 'webdrivers'
  gem 'factory_bot'
end

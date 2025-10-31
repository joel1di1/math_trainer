# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.7'

gem 'rails', '~> 8.1'

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
gem 'tailwindcss-rails', '~> 4.4.0'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dockerfile-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec'
  gem 'rspec-its'
  gem 'rspec-rails'
end

group :development do
  gem 'foreman'
  gem 'hotwire-livereload'
  gem 'rubocop'
  gem 'rubocop-capybara'
  gem 'rubocop-discourse'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'ruby-lsp-rspec', require: false
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'rails-controller-testing'
  gem 'selenium'
  gem 'shoulda-matchers'
  gem 'timecop'
end

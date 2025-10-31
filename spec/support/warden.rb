# frozen_string_literal: true

RSpec.configure do |config|
  config.include Warden::Test::Helpers, type: :feature
  config.include Warden::Test::Helpers, type: :request

  # Enable Warden test mode for feature and request specs
  config.before(:each, type: :feature) do
    Warden.test_mode!
  end

  config.before(:each, type: :request) do
    Warden.test_mode!
  end

  # Reset Warden state after each test
  config.after(:each, type: :system) do
    Warden.test_reset!
  end

  config.after(:each, type: :feature) do
    Warden.test_reset!
  end

  config.after(:each, type: :request) do
    Warden.test_reset!
  end
end

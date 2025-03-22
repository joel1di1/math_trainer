# frozen_string_literal: true

RSpec.configure do |config|
  config.include Warden::Test::Helpers, type: :feature
  config.include Warden::Test::Helpers, type: :request

  # Reset Warden state after each test.
  config.after(:each, type: :system) do
    Warden.test_reset!
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :time_session do
    user { nil }
    minutes { 1 }
    operation_types { 'MyString' }
    frequencies { 'MyString' }
  end
end

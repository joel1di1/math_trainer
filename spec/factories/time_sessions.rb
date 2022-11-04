# frozen_string_literal: true

FactoryBot.define do
  factory :time_session do
    user { create :user }
    minutes { Faker::Number.within(range: 1..20) }
    operation_types { Problem.operation_types_s.sample(2) }
  end
end

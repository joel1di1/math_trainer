# frozen_string_literal: true

FactoryBot.define do
  factory :time_session do
    user
    minutes { Faker::Number.within(range: 1..20) }
    operation_types do
      Problem.operation_types_s.sample(2).index_with do |_operation_type|
        TimeSession.random_operation_type_values
      end
    end
  end
end

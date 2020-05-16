# frozen_string_literal: true

FactoryBot.define do
  factory :problem do
    type { 'Multiplication' }
    number_1 { Faker::Number.number(digits: 3) }
    number_2 { Faker::Number.number(digits: 3) }
  end
end

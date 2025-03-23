# frozen_string_literal: true

FactoryBot.define do
  factory :chained_addition do
    config do
      { number_1: Faker::Number.number(digits: 3),
        number_2: Faker::Number.number(digits: 3),
        number_3: Faker::Number.number(digits: 3) }
    end
  end
end

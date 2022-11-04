# frozen_string_literal: true

FactoryBot.define do
  factory :soustraction do
    number_1 { (10..50).to_a.sample }
    number_2 { Faker::Number.number(digits: 1) }
  end
end

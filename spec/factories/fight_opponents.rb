# frozen_string_literal: true

FactoryBot.define do
  factory :fight_opponent do
    name { Faker::Name.name }
    health { Faker::Number.number(digits: 2) }
    speed { Faker::Number.number(digits: 1) }
    color_rot { Faker::Number.number(digits: 3) }
  end
end

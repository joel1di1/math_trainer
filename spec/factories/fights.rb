# frozen_string_literal: true

FactoryBot.define do
  factory :fight do
    fight_opponent
    user
    remaining_player_health { Faker::Number.number(digits: 2) }
    remaining_opponent_health { Faker::Number.number(digits: 2) }
    round_duration { Faker::Number.number(digits: 2) }
    name { Faker::Name.name }
  end
end

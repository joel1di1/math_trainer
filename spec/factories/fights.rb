# frozen_string_literal: true

FactoryBot.define do
  factory :fight do
    fight_opponent { nil }
    remaining_player_health { 1 }
    remaining_opponent_health { 1 }
    round_duration { 1 }
    name { 'MyString' }
  end
end

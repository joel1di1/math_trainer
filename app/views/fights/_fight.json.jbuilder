# frozen_string_literal: true

json.extract! fight, :id, :fight_opponent_id, :remaining_player_health, :remaining_opponent_health, :round_duration,
              :name, :created_at, :updated_at
json.url fight_url(fight, format: :json)

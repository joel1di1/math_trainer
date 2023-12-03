# frozen_string_literal: true

json.extract! fight_opponent, :id, :name, :health, :speed, :color_rot, :created_at, :updated_at
json.url fight_opponent_url(fight_opponent, format: :json)

# frozen_string_literal: true

json.array! @fight_opponents, partial: 'fight_opponents/fight_opponent', as: :fight_opponent

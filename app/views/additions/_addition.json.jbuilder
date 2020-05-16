# frozen_string_literal: true

json.extract! addition, :id, :created_at, :updated_at
json.url addition_url(addition, format: :json)

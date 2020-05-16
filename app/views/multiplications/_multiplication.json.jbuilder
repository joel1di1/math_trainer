# frozen_string_literal: true

json.extract! multiplication, :id, :created_at, :updated_at
json.url multiplication_url(multiplication, format: :json)

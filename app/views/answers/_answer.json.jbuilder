# frozen_string_literal: true

json.extract! answer, :id, :user_id, :operation_id, :text, :created_at, :updated_at
json.url answer_url(answer, format: :json)

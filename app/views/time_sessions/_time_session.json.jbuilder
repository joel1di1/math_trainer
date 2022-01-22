json.extract! time_session, :id, :user_id, :minutes, :operation_types, :frequencies, :created_at, :updated_at
json.url time_session_url(time_session, format: :json)

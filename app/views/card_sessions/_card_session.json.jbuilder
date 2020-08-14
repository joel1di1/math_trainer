json.extract! card_session, :id, :title, :user_id, :created_at, :updated_at
json.url card_session_url(card_session, format: :json)

# frozen_string_literal: true

json.array! @time_sessions, partial: 'time_sessions/time_session', as: :time_session

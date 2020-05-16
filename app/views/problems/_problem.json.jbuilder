# frozen_string_literal: true

json.extract! problem, :id, :number_1, :number_2, :hole_position, :created_at, :updated_at
json.url problem_url(problem, format: :json)

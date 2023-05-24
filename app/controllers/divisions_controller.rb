# frozen_string_literal: true

class DivisionsController < ApplicationController
  def next
    division = Division.find(params[:id]) if params[:id]
    division ||= Division.random(current_user)
    @answer = division.create_answer!(current_user)

    render 'problems/next'
  end
end

# frozen_string_literal: true

class DivisionsController < ApplicationController
  before_action :set_Division, only: %i[show edit update destroy]

  def next
    division = Division.find(params[:id]) if params[:id]
    division ||= Division.random(current_user)
    @answer = division.create_answer!(current_user)

    render 'problems/next'
  end
end

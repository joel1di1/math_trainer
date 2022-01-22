# frozen_string_literal: true

class MultiplicationsController < ApplicationController
  before_action :set_multiplication, only: %i[show edit update destroy]

  def next
    multiplication = Multiplication.find(params[:id]) if params[:id]
    multiplication ||= Multiplication.random(current_user)
    @answer = multiplication.create_answer!(current_user)

    render 'problems/next'
  end
end

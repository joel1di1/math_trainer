# frozen_string_literal: true

class MultiplicationsController < ApplicationController
  def next
    multiplication = Multiplication.find(params[:id]) if params[:id]
    multiplication ||= Multiplication.random(current_user)
    @answer = multiplication.create_answer!(current_user)

    render 'problems/next'
  end
end

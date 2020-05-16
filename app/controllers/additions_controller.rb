# frozen_string_literal: true

class AdditionsController < ApplicationController
  def next
    addition = Addition.find(params[:id]) if params[:id]
    addition ||= Addition.random(current_user)
    @answer = addition.create_answer!(current_user)

    render 'problems/next'
  end
end

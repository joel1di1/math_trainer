# frozen_string_literal: true

class SoustractionsController < ApplicationController
  def next
    soustraction = Soustraction.find(params[:id]) if params[:id]
    soustraction ||= Soustraction.random(current_user)
    @answer = soustraction.create_answer!(current_user)

    render 'problems/next'
  end
end

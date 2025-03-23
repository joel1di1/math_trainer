# frozen_string_literal: true

class ChainedAdditionsController < ApplicationController
  def next
    chainedaddition = ChainedAddition.find(params[:id]) if params[:id]
    chainedaddition ||= ChainedAddition.random(current_user)
    @answer = chainedaddition.create_answer!(current_user)

    render 'problems/next'
  end
end

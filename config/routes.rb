# frozen_string_literal: true

Rails.application.routes.draw do
  resources :answers
  resources :multiplications
  resources :problems
  devise_for :users
  root 'home#index'
end

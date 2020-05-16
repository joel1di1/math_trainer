# frozen_string_literal: true

Rails.application.routes.draw do
  resources :additions
  resources :answers
  resources :multiplications
  resources :problems
  devise_for :users
  root 'home#index'
end

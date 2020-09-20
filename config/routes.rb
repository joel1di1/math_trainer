# frozen_string_literal: true

Rails.application.routes.draw do
  resources :card_sessions do
    member do
      get :next
    end
  end
  devise_for :users
  root 'home#index'

  # resources :additions
  # resources :multiplications
  resources :answers, only: :update

  resources :multiplications, only: [] do
    collection do
      get :next
    end
  end

  resources :additions, only: [] do
    collection do
      get :next
    end
  end

  resources :soustractions, only: [] do
    collection do
      get :next
    end
  end
end

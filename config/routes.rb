# frozen_string_literal: true

Rails.application.routes.draw do
  resources :fights, only: %i[index new create show] do
    member do
      get :play
      get :end_round
      post :answer, to: 'fights#answer'
      patch :answer, to: 'fights#answer'
    end
  end
  resources :fight_opponents
  resources :time_sessions do
    member do
      post :start
      get :next
      get :end
      post :redo
    end
  end
  resources :card_sessions do
    member do
      get :next
    end
    resources :answers, only: :update
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Guest session management
  get '/session/save', to: 'guest_sessions#save', as: :save_session
  patch '/session/update_uuid', to: 'guest_sessions#update_uuid', as: :update_session_uuid
  get '/session/restore', to: 'guest_sessions#restore', as: :restore_session
  post '/session/restore', to: 'guest_sessions#restore_session'

  root 'home#index'

  resources :answers, only: :update

  resources :multiplications, only: [] do
    collection do
      get :next
    end
  end

  resources :divisions, only: [] do
    collection do
      get :next
    end
  end

  resources :additions, only: [] do
    collection do
      get :next
    end
  end

  resources :chained_additions, only: [] do
    collection do
      get :next
    end
  end

  resources :soustractions, only: [] do
    collection do
      get :next
    end
  end

  resources :user, only: :show
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardSessionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/card_sessions').to route_to('card_sessions#index')
    end

    it 'routes to #new' do
      expect(get: '/card_sessions/new').to route_to('card_sessions#new')
    end

    it 'routes to #show' do
      expect(get: '/card_sessions/1').to route_to('card_sessions#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/card_sessions/1/edit').to route_to('card_sessions#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/card_sessions').to route_to('card_sessions#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/card_sessions/1').to route_to('card_sessions#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/card_sessions/1').to route_to('card_sessions#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/card_sessions/1').to route_to('card_sessions#destroy', id: '1')
    end
  end
end

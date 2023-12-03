# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FightOpponentsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/fight_opponents').to route_to('fight_opponents#index')
    end

    it 'routes to #new' do
      expect(get: '/fight_opponents/new').to route_to('fight_opponents#new')
    end

    it 'routes to #show' do
      expect(get: '/fight_opponents/1').to route_to('fight_opponents#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/fight_opponents/1/edit').to route_to('fight_opponents#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/fight_opponents').to route_to('fight_opponents#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/fight_opponents/1').to route_to('fight_opponents#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/fight_opponents/1').to route_to('fight_opponents#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/fight_opponents/1').to route_to('fight_opponents#destroy', id: '1')
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MultiplicationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/multiplications').to route_to('multiplications#index')
    end

    it 'routes to #new' do
      expect(get: '/multiplications/new').to route_to('multiplications#new')
    end

    it 'routes to #show' do
      expect(get: '/multiplications/1').to route_to('multiplications#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/multiplications/1/edit').to route_to('multiplications#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/multiplications').to route_to('multiplications#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/multiplications/1').to route_to('multiplications#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/multiplications/1').to route_to('multiplications#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/multiplications/1').to route_to('multiplications#destroy', id: '1')
    end
  end
end

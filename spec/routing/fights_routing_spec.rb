# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FightsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/fights').to route_to('fights#index')
    end

    it 'routes to #new' do
      expect(get: '/fights/new').to route_to('fights#new')
    end

    it 'routes to #show' do
      expect(get: '/fights/1').to route_to('fights#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/fights').to route_to('fights#create')
    end
  end
end

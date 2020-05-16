# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProblemsController, type: :routing do
  let(:user) { create :user }

  setup do
    sign_in user
  end

  describe 'routing' do
    it 'routes to #next' do
      # expect(get: '/problems/next').to route_to('problems#next')
    end
  end
end

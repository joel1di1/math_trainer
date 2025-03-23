# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes' do
  describe 'GET /index' do
    it 'returns http success' do
      login_as(create(:user), scope: :user)
      get '/'
      expect(response).to have_http_status(:success)
    end
  end
end

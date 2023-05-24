# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes' do
  describe 'GET /index' do
    it 'returns http success' do
      sign_in(create(:user))
      get '/'
      expect(response).to have_http_status(:success)
    end
  end
end

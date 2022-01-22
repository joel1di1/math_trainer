# frozen_string_literal: true

require 'rails_helper'

describe 'card session', type: :feature do
  let(:user) { create :user }
  let(:card_session) { CardSession.build_addition(range: (4..5), user: user) }

  before :each do
    sign_in user
  end

  it 'let me answer a question and have a feedback' do
    visit "/card_sessions/#{card_session.id}/next"

    # expect(page).to have_text('yolo')
  end
end

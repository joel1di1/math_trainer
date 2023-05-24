# frozen_string_literal: true

require 'rails_helper'

describe 'time session' do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it 'create a new time session' do
    visit '/'

    expect(page).to have_text('Time Sessions')
    within(find_by_id('menu-links')) { click_on 'Time Sessions' }

    expect(page).to have_current_path('/time_sessions')

    click_on 'New Time session'

    fill_in('Temps (minutes)', with: 1)

    check 'Addition'
    check 'Inconnue aléatoire'

    expect { click_on 'Commencer !' }.to change(TimeSession, :count).by(1)

    time_session = TimeSession.last
    expect(page).to have_current_path("/time_sessions/#{time_session.id}/next")
    expect(time_session.shuffle_hole_position).to be_truthy
  end

  it 'next time session on ended session redirects to end' do
    time_session = create(:time_session, user:, minutes: 10)
    visit next_time_session_path(time_session)
    expect(page).to have_selector(:link_or_button, 'OK')

    Timecop.travel(5.minutes.from_now) do
      visit next_time_session_path(time_session)
      expect(page).to have_selector(:link_or_button, 'OK')
    end

    Timecop.travel(11.minutes.from_now) do
      visit next_time_session_path(time_session)
      expect(page).not_to have_selector(:link_or_button, 'OK')
      assert_text 'La session est finie!'
    end
  end

  it 'redo time session creates a new time session and start it' do
    time_session = create(:time_session, user:, minutes: 10)

    visit time_sessions_path
    within("#time_session_#{time_session.id}") { click_on 'Refaire' }

    expect(page).to have_current_path("/time_sessions/#{TimeSession.last.id}/next")
    expect(TimeSession.last).not_to eq(time_session)
  end
end

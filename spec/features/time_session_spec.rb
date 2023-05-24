# frozen_string_literal: true

require 'rails_helper'

describe 'time session', type: :feature do
  let(:user) { create :user }

  before :each do
    sign_in user
  end

  it 'create a new time session' do
    visit '/'

    expect(page).to have_text('Time Sessions')
    within(find('#menu-links')) { click_on 'Time Sessions' }

    expect(current_path).to eq('/time_sessions')

    click_on 'New Time session'

    fill_in('Temps (minutes)', with: 1)

    check 'Addition'
    check 'Inconnue aléatoire'

    expect { click_on 'Commencer !' }.to change(TimeSession, :count).by(1)

    time_session = TimeSession.last
    expect(current_path).to eq("/time_sessions/#{time_session.id}/next")
    expect(time_session.shuffle_hole_position).to be_truthy
  end

  it 'next time session on ended session redirects to end' do
    time_session = create :time_session, user: user, minutes: 10
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
end

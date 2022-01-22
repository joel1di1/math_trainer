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
    click_on 'Time Sessions'

    expect(current_path).to eq('/time_sessions')

    click_on 'New Time session'

    fill_in('Minutes', with: 5)
    select 'additions', from: 'Operation types'
    select 'multiplications', from: 'Operation types'

    expect { click_on 'Create Time session' }.to change(TimeSession, :count).by(1)
    expect(current_path).to eq(time_session_path(TimeSession.last))

    click_on 'Commencer!'

    time_session = TimeSession.last
    expect(current_path).to eq("/time_sessions/#{time_session.id}/next")
  end
end

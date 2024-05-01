# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fight session' do
  let(:user) { create(:user) }
  let(:fight_opponent) { create(:fight_opponent) }

  before do
    sign_in user
    fight_opponent
  end

  it 'create a new fight session' do
    visit '/'

    within('#menu-links') { click_on 'Fight!' }
    expect(page).to have_current_path('/fights')

    expect { click_on fight_opponent.name }.to change(Fight, :count).by(1)

    fight = Fight.last
    expect(page).to have_current_path("/fights/#{fight.id}/play")
  end
end

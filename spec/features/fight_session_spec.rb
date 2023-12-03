# frozen_string_literal: true

require 'rails_helper'

describe 'fight session' do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it 'create a new fight session' do
    visit '/'

    expect(page).to have_text('Fight!')
    within(find_by_id('menu-links')) { click_on 'Fight!' }

    expect(page).to have_current_path('/fights')

    click_on 'New fight'

    expect { click_on 'Fight!' }.to change(FightSession, :count).by(1)

    fight_session = FightSession.last
    expect(page).to have_current_path("/fights/#{fight_session.id}")
  end
end

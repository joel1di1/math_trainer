# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fight session' do
  let(:user) { create(:user) }
  let(:fight_opponent) { create(:fight_opponent) }
  let(:fight_opponents) { create_list(:fight_opponent, 2) + [fight_opponent] }

  before do
    # Ensure user is created before login
    user
    login_as(user, scope: :user)
  end

  context 'with fight opponents' do
    before do
      # Create fight opponents after login
      fight_opponents
    end

    it 'create a new fight session' do
      visit '/'

      # Wait for the menu to be present
      expect(page).to have_css('#menu-links')

      # Click the Fight link in the desktop menu to avoid ambiguity
      within('#menu-links') { click_link 'Fight!' }
      expect(page).to have_current_path('/fights/new')

      # Wait for the page to load and the opponent to be present
      expect(page).to have_text(fight_opponent.name)

      click_button "Fight #{fight_opponent.name}!"

      fight = Fight.last
      expect(page).to have_current_path("/fights/#{fight.id}/play")
    end
  end
end

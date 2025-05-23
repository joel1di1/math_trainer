# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fight session' do
  let(:user) { create(:user) }
  let(:fight_opponent) { create(:fight_opponent) }
  let(:fight_opponents) { create_list(:fight_opponent, 2) + [fight_opponent] }

  before do
    login_as(user, scope: :user)
    fight_opponent
  end

  context 'with fight opponents' do
    before do
      fight_opponents
    end

    it 'create a new fight session' do
      visit '/'

      # Wait for the menu to be present
      expect(page).to have_css('#menu-links')

      within('#menu-links') do
        link = find('a', text: 'Fight!')
        page.execute_script('arguments[0].click();', link)
      end
      expect(page).to have_current_path('/fights/new')

      # Wait for the page to load and the opponent to be present
      expect(page).to have_css('a', text: fight_opponent.name)

      expect do
        link = find('a', text: fight_opponent.name)
        page.execute_script('arguments[0].click();', link)
      end.to change(Fight, :count).by(1)

      fight = Fight.last
      expect(page).to have_current_path("/fights/#{fight.id}/play")
    end
  end
end

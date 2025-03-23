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

      within('#menu-links') { click_on 'Fight!' }
      expect(page).to have_current_path('/fights/new')

      expect { click_on fight_opponent.name }.to change(Fight, :count).by(1)

      fight = Fight.last
      expect(page).to have_current_path("/fights/#{fight.id}/play")
    end
  end
end

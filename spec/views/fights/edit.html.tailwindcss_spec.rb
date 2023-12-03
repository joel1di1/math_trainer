# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fights/edit' do
  let(:fight) do
    Fight.create!(
      fight_opponent: nil,
      remaining_player_health: 1,
      remaining_opponent_health: 1,
      round_duration: 1,
      name: 'MyString'
    )
  end

  before do
    assign(:fight, fight)
  end

  it 'renders the edit fight form' do
    render

    assert_select 'form[action=?][method=?]', fight_path(fight), 'post' do
      assert_select 'input[name=?]', 'fight[fight_opponent_id]'

      assert_select 'input[name=?]', 'fight[remaining_player_health]'

      assert_select 'input[name=?]', 'fight[remaining_opponent_health]'

      assert_select 'input[name=?]', 'fight[round_duration]'

      assert_select 'input[name=?]', 'fight[name]'
    end
  end
end

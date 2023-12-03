# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fight_opponents/edit' do
  let(:fight_opponent) do
    FightOpponent.create!(
      name: 'MyString',
      health: 1,
      speed: 1,
      color_rot: 1
    )
  end

  before do
    assign(:fight_opponent, fight_opponent)
  end

  it 'renders the edit fight_opponent form' do
    render

    assert_select 'form[action=?][method=?]', fight_opponent_path(fight_opponent), 'post' do
      assert_select 'input[name=?]', 'fight_opponent[name]'

      assert_select 'input[name=?]', 'fight_opponent[health]'

      assert_select 'input[name=?]', 'fight_opponent[speed]'

      assert_select 'input[name=?]', 'fight_opponent[color_rot]'
    end
  end
end

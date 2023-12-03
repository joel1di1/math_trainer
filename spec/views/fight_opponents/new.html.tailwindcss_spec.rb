# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fight_opponents/new' do
  before do
    assign(:fight_opponent, FightOpponent.new(
                              name: 'MyString',
                              health: 1,
                              speed: 1,
                              color_rot: 1
                            ))
  end

  it 'renders new fight_opponent form' do
    render

    assert_select 'form[action=?][method=?]', fight_opponents_path, 'post' do
      assert_select 'input[name=?]', 'fight_opponent[name]'

      assert_select 'input[name=?]', 'fight_opponent[health]'

      assert_select 'input[name=?]', 'fight_opponent[speed]'

      assert_select 'input[name=?]', 'fight_opponent[color_rot]'
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fight_opponents/index' do
  before do
    assign(:fight_opponents, [
             FightOpponent.create!(
               name: 'Name',
               health: 2,
               speed: 3,
               color_rot: 4
             ),
             FightOpponent.create!(
               name: 'Name',
               health: 2,
               speed: 3,
               color_rot: 4
             )
           ])
  end

  it 'renders a list of fight_opponents' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
  end
end

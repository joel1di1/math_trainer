# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fights/index' do
  before do
    assign(:fights, create_list(:fight, 2, remaining_player_health: 2,
                                           remaining_opponent_health: 3,
                                           round_duration: 4))
    assign(:fight_opponents, create_list(:fight_opponent, 2))
  end

  it 'renders a list of fights' do
    render
    cell_selector = 'div#fights>div'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
  end
end

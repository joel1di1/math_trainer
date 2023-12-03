# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fights/index' do
  before do
    assign(:fights, [
             Fight.create!(
               fight_opponent: nil,
               remaining_player_health: 2,
               remaining_opponent_health: 3,
               round_duration: 4,
               name: 'Name'
             ),
             Fight.create!(
               fight_opponent: nil,
               remaining_player_health: 2,
               remaining_opponent_health: 3,
               round_duration: 4,
               name: 'Name'
             )
           ])
  end

  it 'renders a list of fights' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
  end
end

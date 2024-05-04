# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fights/new' do
  let(:fight_opponents) { create_list(:fight_opponent, 3) }

  before do
    assign(:fight_opponents, fight_opponents)
  end

  it 'renders list of fight opponents' do
    render

    assert_select 'div#fight_opponents>form', count: 3

    fight_opponents.each do |fight_opponent|
      assert_select 'div#fight_opponents>form>button', text: Regexp.new(fight_opponent.name)
    end
  end
end

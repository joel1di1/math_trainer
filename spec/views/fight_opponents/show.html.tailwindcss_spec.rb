# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fight_opponents/show' do
  before do
    assign(:fight_opponent, FightOpponent.create!(
                              name: 'Name',
                              health: 2,
                              speed: 3,
                              color_rot: 4
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end

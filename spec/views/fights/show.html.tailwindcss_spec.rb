# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fights/show' do
  before do
    assign(:fight, create(:fight, remaining_player_health: 2,
                                  remaining_opponent_health: 3,
                                  round_duration: 4))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Name/)
  end
end

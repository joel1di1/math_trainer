# frozen_string_literal: true

require 'rails_helper'

describe 'time session', type: :feature do
  let(:user) { create :user }

  before :each do
    sign_in user
  end

  it 'create a new time session' do
    visit '/'

    expect(page).to have_text('Time Sessions')
    click_on 'Time Sessions'

    expect(current_path).to eq('/time_sessions')
    fill_in
  end
end

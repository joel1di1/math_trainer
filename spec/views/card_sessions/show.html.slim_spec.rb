# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'card_sessions/show' do
  before do
    @card_session = assign(:card_session, CardSession.create!(
                                            title: 'Title',
                                            user: nil
                                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
  end
end

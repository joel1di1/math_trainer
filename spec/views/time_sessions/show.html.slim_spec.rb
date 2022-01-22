# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'time_sessions/show', type: :view do
  before(:each) do
    @time_session = assign(:time_session, TimeSession.create!(
                                            user: nil,
                                            minutes: 2,
                                            operation_types: 'Operation Types',
                                            frequencies: 'Frequencies'
                                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Operation Types/)
    expect(rendered).to match(/Frequencies/)
  end
end

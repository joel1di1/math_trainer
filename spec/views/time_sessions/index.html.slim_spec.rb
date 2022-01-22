# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'time_sessions/index', type: :view do
  before(:each) do
    assign(:time_sessions, [
             TimeSession.create!(
               user: nil,
               minutes: 2,
               operation_types: 'Operation Types',
               frequencies: 'Frequencies'
             ),
             TimeSession.create!(
               user: nil,
               minutes: 2,
               operation_types: 'Operation Types',
               frequencies: 'Frequencies'
             )
           ])
  end

  it 'renders a list of time_sessions' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 'Operation Types'.to_s, count: 2
    assert_select 'tr>td', text: 'Frequencies'.to_s, count: 2
  end
end

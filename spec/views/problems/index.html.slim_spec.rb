# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'problems/index', type: :view do
  before(:each) do
    assign(:problems, [
             Problem.create!(
               number_1: 2,
               number_2: 3,
               hole_position: 4
             ),
             Problem.create!(
               number_1: 2,
               number_2: 3,
               hole_position: 4
             )
           ])
  end

  it 'renders a list of problems' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
    assert_select 'tr>td', text: 4.to_s, count: 2
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'problems/edit', type: :view do
  before(:each) do
    @problem = assign(:problem, Problem.create!(
                                  number_1: 1,
                                  number_2: 1,
                                  hole_position: 1
                                ))
  end

  it 'renders the edit problem form' do
    render

    assert_select 'form[action=?][method=?]', problem_path(@problem), 'post' do
      assert_select 'input[name=?]', 'problem[number_1]'

      assert_select 'input[name=?]', 'problem[number_2]'

      assert_select 'input[name=?]', 'problem[hole_position]'
    end
  end
end

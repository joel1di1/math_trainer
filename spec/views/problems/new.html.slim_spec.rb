# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'problems/new', type: :view do
  before(:each) do
    assign(:problem, Problem.new(
                       number_1: 1,
                       number_2: 1,
                       hole_position: 1
                     ))
  end

  it 'renders new problem form' do
    render

    assert_select 'form[action=?][method=?]', problems_path, 'post' do
      assert_select 'input[name=?]', 'problem[number_1]'

      assert_select 'input[name=?]', 'problem[number_2]'

      assert_select 'input[name=?]', 'problem[hole_position]'
    end
  end
end

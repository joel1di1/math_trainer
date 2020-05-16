# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'problems/show', type: :view do
  before(:each) do
    @problem = assign(:problem, Problem.create!(
                                  number_1: 2,
                                  number_2: 3,
                                  hole_position: 4
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end

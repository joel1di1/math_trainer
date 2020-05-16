# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'multiplications/index', type: :view do
  before(:each) do
    assign(:multiplications, [
             Multiplication.create!,
             Multiplication.create!
           ])
  end

  it 'renders a list of multiplications' do
    render
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'multiplications/show', type: :view do
  before(:each) do
    @multiplication = assign(:multiplication, Multiplication.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end

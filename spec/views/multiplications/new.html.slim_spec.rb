# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'multiplications/new', type: :view do
  before(:each) do
    assign(:multiplication, Multiplication.new)
  end

  it 'renders new multiplication form' do
    render

    assert_select 'form[action=?][method=?]', multiplications_path, 'post' do
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'multiplications/edit', type: :view do
  before(:each) do
    @multiplication = assign(:multiplication, Multiplication.create!)
  end

  it 'renders the edit multiplication form' do
    render

    assert_select 'form[action=?][method=?]', multiplication_path(@multiplication), 'post' do
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'additions/edit', type: :view do
  before(:each) do
    @addition = assign(:addition, Addition.create!)
  end

  it 'renders the edit addition form' do
    render

    assert_select 'form[action=?][method=?]', addition_path(@addition), 'post' do
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'additions/new', type: :view do
  before(:each) do
    assign(:addition, Addition.new)
  end

  it 'renders new addition form' do
    render

    assert_select 'form[action=?][method=?]', additions_path, 'post' do
    end
  end
end

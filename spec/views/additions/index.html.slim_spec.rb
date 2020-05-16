# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'additions/index', type: :view do
  before(:each) do
    assign(:additions, [
             Addition.create!,
             Addition.create!
           ])
  end

  it 'renders a list of additions' do
    render
  end
end

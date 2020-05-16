# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'additions/show', type: :view do
  before(:each) do
    @addition = assign(:addition, Addition.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end

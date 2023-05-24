# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }

  it { expect(user.email).to be_truthy }
end

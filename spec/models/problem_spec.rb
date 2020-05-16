# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Problem, type: :model do
  subject(:problem) { Problem.new }

  describe '.correct?' do
    it 'is raise not implemented error' do
      expect { problem.correct?(nil) }.to raise_error('correct? not implemented for Problem.')
    end
  end
end

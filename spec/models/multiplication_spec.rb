# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Multiplication, type: :model do
  let(:multiplication) { create :multiplication }

  describe '#correct?' do
    context 'defined numbers' do
      let(:multiplication) { create :multiplication, number_1: 2, number_2: 8 }

      it { expect(multiplication.correct?(Answer.new(text: '16'))).to be true }
      it { expect(multiplication.correct?(Answer.new(text: '32'))).to be false }
    end

    context 'generated numbers' do
      let(:answer) { Answer.new(text: (multiplication.number_1 * multiplication.number_2).to_s) }
      let(:false_answer) { Answer.new(text: (multiplication.number_1 * multiplication.number_2 - 1).to_s) }

      it { expect(multiplication.correct?(answer)).to be true }
      it { expect(multiplication.correct?(false_answer)).to be false }
    end
  end
end

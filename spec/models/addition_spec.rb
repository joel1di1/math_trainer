# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Addition, type: :model do
  let(:addition) { create :addition }

  describe '#correct?' do
    context 'defined numbers' do
      let(:addition) { create :addition, number_1: 2, number_2: 8 }

      it { expect(addition.correct?(Answer.new(text: '10'))).to be true }
      it { expect(addition.correct?(Answer.new(text: '32'))).to be false }
    end

    context 'generated numbers' do
      let(:answer) { Answer.new(text: (addition.number_1 + addition.number_2).to_s) }
      let(:false_answer) { Answer.new(text: (addition.number_1 + addition.number_2 - 1).to_s) }

      it { expect(addition.correct?(answer)).to be true }
      it { expect(addition.correct?(false_answer)).to be false }
    end
  end
end

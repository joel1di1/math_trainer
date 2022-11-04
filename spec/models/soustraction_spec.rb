# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Soustraction, type: :model do
  let(:soustraction) { create :soustraction }

  describe '#correct?' do
    context 'defined numbers' do
      let(:soustraction) { create :soustraction, number_1: 8, number_2: 3 }

      it { expect(soustraction.correct?(Answer.new(text: '5'))).to be true }
      it { expect(soustraction.correct?(Answer.new(text: '6'))).to be false }
    end

    context 'generated numbers' do
      let(:answer) { Answer.new(text: (soustraction.number_1 - soustraction.number_2).to_s) }
      let(:false_answer) { Answer.new(text: (soustraction.number_1 - soustraction.number_2 - 1).to_s) }

      it { expect(soustraction.correct?(answer)).to be true }
      it { expect(soustraction.correct?(false_answer)).to be false }
    end

    context 'with hole position at 1' do
      let(:soustraction) { create :soustraction, hole_position: 1 }

      let(:answer) { Answer.new(text: soustraction.number_1.to_s) }
      it { expect(soustraction.correct?(answer)).to be true }
    end

    context 'with hole position at 2' do
      let(:soustraction) { create :soustraction, hole_position: 2 }

      let(:answer) { Answer.new(text: soustraction.number_2.to_s) }
      it { expect(soustraction.correct?(answer)).to be true }
    end
  end
end

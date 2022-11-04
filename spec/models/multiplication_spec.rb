# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Multiplication, type: :model do
  let(:multiplication) { create :multiplication }
  let(:user) { create :user }

  describe '#correct?' do
    context 'defined numbers' do
      let(:multiplication) { create :multiplication, number_1: 2, number_2: 8 }

      it { expect(multiplication.correct?(Answer.new(text: '16'))).to be true }
      it { expect(multiplication.correct?(Answer.new(text: '32'))).to be false }
    end

    context 'generated numbers' do
      let(:answer) { Answer.new(text: (multiplication.number_1 * multiplication.number_2).to_s) }
      let(:false_answer) { Answer.new(text: ((multiplication.number_1 * multiplication.number_2) - 1).to_s) }

      it { expect(multiplication.correct?(answer)).to be true }
      it { expect(multiplication.correct?(false_answer)).to be false }
    end

    context 'with hole position at 1' do
      let(:multiplication) { create :multiplication, hole_position: 1 }

      let(:answer) { Answer.new(text: multiplication.number_1.to_s) }
      it { expect(multiplication.correct?(answer)).to be true }
    end

    context 'with hole position at 2' do
      let(:multiplication) { create :multiplication, hole_position: 2 }

      let(:answer) { Answer.new(text: multiplication.number_2.to_s) }
      it { expect(multiplication.correct?(answer)).to be true }
    end
  end

  describe '.random' do
    subject { Multiplication.random(user) }

    it { should be_kind_of(Multiplication) }
    its(:number_1) { should be_kind_of(Integer) }
    its(:number_2) { should be_kind_of(Integer) }
  end
end

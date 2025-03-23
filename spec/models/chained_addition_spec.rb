# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChainedAddition do
  let(:chained_addition) { create(:chained_addition) }

  describe '#correct?' do
    context 'with defined numbers' do
      let(:chained_addition) do
        create(:chained_addition, config: {
                 number_1: 2,
                 number_2: 8,
                 number_3: 10
               })
      end

      it { expect(chained_addition.correct?(Answer.new(text: '20'))).to be true }
      it { expect(chained_addition.correct?(Answer.new(text: '32'))).to be false }
    end

    context 'with generated numbers' do
      let(:answer) do
        Answer.new(text: (
        chained_addition.config['number_1'] + chained_addition.config['number_2'] + chained_addition.config['number_3']
      ).to_s)
      end

      let(:false_answer) { Answer.new(text: '99999999') }

      it { expect(chained_addition.correct?(answer)).to be true }
      it { expect(chained_addition.correct?(false_answer)).to be false }
    end
  end
end

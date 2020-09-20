# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardSession, type: :model do
  describe '.build_addition' do
    subject(:card_session) { CardSession.build_addition(range: range) }
    # CardSession.build_addition([4, 5])
    context 'with single number as range' do
      let(:range) { 4 }
      it { expect(card_session.problems.size).to eq(11) }
    end

    context 'with array of number as range' do
      let(:range) { [4, 5] }
      it { expect(card_session.problems.size).to eq(22) }
    end

    context 'with range as range' do
      let(:range) { (4..6) }
      it { expect(card_session.problems.size).to eq(33) }
    end
  end
end

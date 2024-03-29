# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardSession do
  let(:user) { create(:user) }

  describe '.build_addition' do
    subject(:card_session) { described_class.build_addition(range:, user:) }

    let(:range) { 0 }

    context 'with specified user' do
      it { expect(card_session.user).to eq(user) }

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

  describe '#next' do
    # rubocop:disable RSpec/NoExpectationExample
    it 'get next problem with non valid answer' do
      card_session = create(:card_session, user:)
      problem_1 = create(:addition, number_1: 2, number_2: 3)
      problem_2 = create(:addition, number_1: 5, number_2: 4)
      card_session.problems = [problem_1, problem_2]

      # assert = card_session.next
      # answer = first_problem.create_answer!(user)
      # answer.update!(text: )
      # fir
    end
    # rubocop:enable RSpec/NoExpectationExample
  end
end

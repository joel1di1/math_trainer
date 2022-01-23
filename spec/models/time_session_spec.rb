# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TimeSession, type: :model do
  let(:operation_types) { Problem.operation_types_s.sample(2) }
  let(:time_session) { create :time_session, operation_types: operation_types }

  describe '#next_problem' do
    subject(:next_problem) { time_session.next_problem }
    it 'gives a new problem' do
      expect(next_problem).not_to be_nil
    end

    context 'only additions' do
      let(:operation_types) { [Addition.to_s] }
      it {
        expect(next_problem).to be_instance_of(Addition)
      }
    end

    context 'only multiplications' do
      let(:operation_types) { [Multiplication.to_s] }
      it {
        expect(next_problem).to be_instance_of(Multiplication)
      }
    end

    context 'with operation types as nil' do
      let(:operation_types) { nil }
      it { expect(next_problem).to be_kind_of(Problem) }
    end
  end

  describe '#ended?' do
    it 'ends after minutes after create' do
      Timecop.travel(time_session.created_at) do
        assert !time_session.ended?
      end
      Timecop.travel(time_session.created_at + (time_session.minutes + 1).minutes) do
        assert time_session.ended?
      end
    end
  end

  describe '#answered_count' do
    it 'counts only answered answers' do
      time_session.answers << create(:answer, user: time_session.user, text: 'yes', correct: true)
      time_session.answers << create(:answer, user: time_session.user, text: 'no', correct: false)
      time_session.answers << create(:answer, user: time_session.user, text: nil)

      expect(time_session.answered_count).to eq(2)
    end
  end

  describe '#correct_rate' do
    subject(:correct_rate) { time_session.correct_rate }

    context 'with one good answer over one' do
      before { time_session.answers << create(:answer, user: time_session.user, text: 'yes', correct: true) }
      it { expect(correct_rate).to eq(100) }
    end

    context 'with one good answer over two' do
      before { time_session.answers << create(:answer, user: time_session.user, text: 'yes', correct: true) }
      before { time_session.answers << create(:answer, user: time_session.user, text: 'no', correct: false) }

      it { expect(correct_rate).to eq(50) }
    end
  end
end

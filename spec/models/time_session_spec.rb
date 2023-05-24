# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TimeSession do
  let(:time_session) { create(:time_session, operation_types:) }
  let(:operation_types) { { operation_type => described_class.random_operation_type_values } }
  let(:operation_type) { Problem.operation_types_s.sample }

  it { is_expected.to validate_presence_of(:minutes) }

  describe '#next_problem' do
    subject(:next_problem) { time_session.next_problem }

    it 'gives a new problem' do
      expect(next_problem).not_to be_nil
    end

    context 'only additions' do
      let(:operation_type) { Addition.to_s }

      it { expect(next_problem).to be_instance_of(Addition) }
    end

    context 'only multiplications' do
      let(:operation_type) { Multiplication.to_s }

      it { expect(next_problem).to be_instance_of(Multiplication) }

      context 'table of 2, only 7' do
        let(:operation_type) { Multiplication.to_s }
        let(:operation_types) { { operation_type => { table_numbers: [2], frequencies: { 7 => 1 } } } }

        it { expect(next_problem).to be_instance_of(Multiplication) }
        it { expect([next_problem.number_1, next_problem.number_2]).to contain_exactly(2, 7) }
      end
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
      before do
        time_session.answers << create(:answer, user: time_session.user, text: 'yes', correct: true)
        time_session.answers << create(:answer, user: time_session.user, text: 'no', correct: false)
      end

      it { expect(correct_rate).to eq(50) }
    end
  end
end

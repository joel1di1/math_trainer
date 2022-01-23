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
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Problem do
  subject(:problem) { create(:problem) }

  let!(:user) { create(:user) }

  describe '.correct?' do
    it 'is raise not implemented error' do
      expect { problem.correct?(nil) }.to raise_error('correct? not implemented for Problem.')
    end
  end

  describe '.create_answer!' do
    subject { problem.create_answer!(user) }

    it { is_expected.to be_a(Answer) }
    its(:user) { is_expected.to eq(user) }
    its(:id) { is_expected.to be_truthy }
    its(:text) { is_expected.to be_nil }
  end

  describe '.operation_types_s' do
    subject(:operation_types) { described_class.operation_types_s }

    it { expect(operation_types).to include('Addition') }
  end

  describe '.operation_types' do
    subject(:operation_types) { described_class.operation_types }

    it { expect(operation_types).to include(Addition) }
    it { expect(operation_types).to include(Multiplication) }
    it { expect(operation_types).to include(Division) }
    it { expect(operation_types).to include(Soustraction) }
  end
end

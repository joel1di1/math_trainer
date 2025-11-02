# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }

  it { expect(user.email).to be_truthy }

  describe 'UUID management' do
    it 'auto-generates UUID on creation' do
      user = described_class.create!(email: 'test@example.com', password: 'password123')
      expect(user.uuid).to be_present
      expect(user.uuid).to match(/\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/i)
    end

    it 'allows custom UUID values' do
      user.uuid = 'mycustomcode'
      expect(user.save).to be true
      expect(user.reload.uuid).to eq('mycustomcode')
    end

    it 'ensures UUID uniqueness' do
      user.update!(uuid: 'uniquecode')
      duplicate_user = build(:user, uuid: 'uniquecode')

      expect(duplicate_user.save).to be false
      expect(duplicate_user.errors[:uuid]).to include('has already been taken')
    end

    it 'allows alphanumeric and underscores in custom UUIDs' do
      valid_uuids = %w[simple my_code CODE123 user_123_abc]

      valid_uuids.each do |uuid_value|
        user.uuid = uuid_value
        expect(user.valid?).to be(true), "Expected #{uuid_value} to be valid"
      end
    end

    it 'suggests minimum length for custom UUIDs' do
      # This is a suggestion, not a hard requirement per user's request
      # Just documenting expected behavior
      user.uuid = 'ab'
      # Should still be valid (no restriction per requirements)
      expect(user.valid?).to be true
    end
  end

  describe 'current_streak' do
    it 'calculates consecutive correct answers' do
      # Create mix of correct and incorrect answers
      create(:answer, user:, correct: true, text: '10', created_at: 5.minutes.ago)
      create(:answer, user:, correct: true, text: '20', created_at: 4.minutes.ago)
      create(:answer, user:, correct: false, text: '5', created_at: 3.minutes.ago)
      create(:answer, user:, correct: true, text: '15', created_at: 2.minutes.ago)
      create(:answer, user:, correct: true, text: '25', created_at: 1.minute.ago)

      expect(user.current_streak).to eq(2)
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Problem, type: :model do
  subject(:problem) { create :problem }
  let!(:user) { create :user }

  describe '.correct?' do
    it 'is raise not implemented error' do
      expect { problem.correct?(nil) }.to raise_error('correct? not implemented for Problem.')
    end
  end

  describe '.create_answer!' do
    subject { problem.create_answer!(user) }

    it { should be_kind_of(Answer) }
    its(:user) { should eq(user) }
    its(:id) { should be_truthy }
    its(:text) { should be_nil }
  end
end

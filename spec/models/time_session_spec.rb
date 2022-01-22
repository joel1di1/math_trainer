# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TimeSession, type: :model do
  let(:time_session) { create :time_session }

  describe '#next_problem' do
    subject(:next_problem) { time_session.next_problem }
    it 'gives a new problem' do
      expect(next_problem).not_to be_nil
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:problem) }

  let(:problem) { create :addition }
  let(:answer) { create :answer, problem: }

  it 'cannot be answered twice' do
    answer.text = 'test'
    assert answer.save

    answer.text = 'test 2'
    expect { answer.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end

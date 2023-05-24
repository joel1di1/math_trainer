# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer do
  let(:answer) { create(:answer, problem:) }
  let(:problem) { create(:addition) }

  it { is_expected.to belong_to(:problem) }
  it { is_expected.to belong_to(:user) }

  it 'cannot be answered twice' do
    answer.text = 'test'
    assert answer.save

    answer.text = 'test 2'
    expect { answer.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end

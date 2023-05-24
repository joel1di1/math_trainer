# frozen_string_literal: true

require 'rails_helper'

describe 'next multiplication' do
  let(:user) { create(:user) }
  let(:congrat_message) { 'congrats !' }
  let(:missed_message) { 'missed !' }

  before do
    sign_in user
  end

  it 'let me answer a question and have a feedback' do
    allow(Multiplication).to receive(:random).and_return(Multiplication.find_or_create_by!(number_1: 3, number_2: 6),
                                                         Multiplication.find_or_create_by!(number_1: 4, number_2: 7))
    allow_any_instance_of(AnswersController).to receive(:random_congrats_message).and_return(congrat_message) # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(AnswersController).to receive(:random_missed_message).and_return(missed_message) # rubocop:disable RSpec/AnyInstance

    visit '/'
    within(find_by_id('menu-links')) { click_on 'Multiplications' }

    expect(page).to have_current_path('/multiplications/next')
    expect(page).to have_text('3 x 6 =')

    fill_in 'answer_text', with: '33'
    click_button 'OK'

    expect(page).to have_text(missed_message)
    expect(page).to have_text('3 x 6 =')

    fill_in 'answer_text', with: '18'
    click_button 'OK'

    expect(page).to have_text(congrat_message)
  end
end

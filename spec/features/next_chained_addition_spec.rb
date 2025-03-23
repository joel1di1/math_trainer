# frozen_string_literal: true

require 'rails_helper'

describe 'next addition' do
  let(:user) { create(:user) }
  let(:congrat_message) { 'congrats !' }
  let(:missed_message) { 'missed !' }

  before do
    login_as(user, scope: :user)
  end

  it 'let me answer a question and have a feedback' do
    allow(ChainedAddition).to receive(:random).and_return(
      ChainedAddition.find_or_create_by!(config: { number_1: 3, number_2: 6, number_3: 5 }),
      ChainedAddition.find_or_create_by!(config: { number_1: 1, number_2: 9, number_3: 2 })
    )
    allow_any_instance_of(AnswersController).to receive(:random_congrats_message).and_return(congrat_message) # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(AnswersController).to receive(:random_missed_message).and_return(missed_message) # rubocop:disable RSpec/AnyInstance

    visit '/'
    within('#menu-links') { click_on 'Additions Chainées' }

    expect(page).to have_current_path('/chained_additions/next')
    expect(page).to have_text('3 + 6 + 5 =')

    fill_in 'answer_text', with: '33'
    click_on 'OK'

    expect(page).to have_text(missed_message)
    expect(page).to have_text('3 + 6 + 5 =')

    fill_in 'answer_text', with: '14'
    click_on 'OK'

    expect(page).to have_text(congrat_message)
  end
end

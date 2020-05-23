# frozen_string_literal: true

require 'rails_helper'

describe 'next multiplication', type: :feature do
  let(:user) { create :user }
  let(:congrat_message) { 'congrats !' }
  let(:missed_message) { 'missed !' }

  before :each do
    sign_in user
  end

  it 'let me answer a question and have a feedback' do
    allow(Soustraction).to receive(:random).and_return(Soustraction.find_or_create_by!(number_1: 7, number_2: 3), Soustraction.find_or_create_by!(number_1: 4, number_2: 7))
    allow_any_instance_of(AnswersController).to receive(:random_congrats_message).and_return(congrat_message)
    allow_any_instance_of(AnswersController).to receive(:random_missed_message).and_return(missed_message)

    visit '/'
    click_on 'Soustractions'

    expect(current_path).to eq('/soustractions/next')
    expect(page).to have_text('7 - 3 =')

    fill_in 'answer_text', with: '5'
    click_button 'OK'

    expect(page).to have_text(missed_message)
    expect(page).to have_text('7 - 3 =')

    fill_in 'answer_text', with: '4'
    click_button 'OK'

    expect(page).to have_text(congrat_message)
  end
end

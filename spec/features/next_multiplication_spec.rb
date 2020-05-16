# frozen_string_literal: true

require 'rails_helper'

describe 'next multiplication', type: :feature do
  let(:user) { create :user }
  let(:congrat_message) { 'congrats !' }

  before :each do
    sign_in user
  end

  it 'let me answer a question and have a feedback' do
    allow(Multiplication).to receive(:random).and_return(Multiplication.find_or_create_by!(number_1: 3, number_2: 6))
    allow_any_instance_of(AnswersController).to receive(:random_congrats_message).and_return(congrat_message)

    visit '/'
    click_on 'Multiplications'

    expect(current_path).to eq('/multiplications/next')
    expect(page).to have_text('3 x 6 =')

    fill_in 'answer_text', with: '18'
    click_button 'Répondre'
    expect(page).to have_text(congrat_message)
  end
end

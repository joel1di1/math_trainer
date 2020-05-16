# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'answers/edit', type: :view do
  before(:each) do
    @answer = assign(:answer, Answer.create!(
                                user: nil,
                                operation: nil,
                                text: 'MyString'
                              ))
  end

  it 'renders the edit answer form' do
    render

    assert_select 'form[action=?][method=?]', answer_path(@answer), 'post' do
      assert_select 'input[name=?]', 'answer[user_id]'

      assert_select 'input[name=?]', 'answer[operation_id]'

      assert_select 'input[name=?]', 'answer[text]'
    end
  end
end

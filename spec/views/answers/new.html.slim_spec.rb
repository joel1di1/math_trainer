# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'answers/new', type: :view do
  before(:each) do
    assign(:answer, Answer.new(
                      user: nil,
                      operation: nil,
                      text: 'MyString'
                    ))
  end

  it 'renders new answer form' do
    render

    assert_select 'form[action=?][method=?]', answers_path, 'post' do
      assert_select 'input[name=?]', 'answer[user_id]'

      assert_select 'input[name=?]', 'answer[operation_id]'

      assert_select 'input[name=?]', 'answer[text]'
    end
  end
end

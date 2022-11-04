# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'card_sessions/new', type: :view do
  before(:each) do
    assign(:card_session, CardSession.new(
                            title: 'MyString',
                            user: nil
                          ))
  end

  it 'renders new card_session form' do
    render

    assert_select 'form[action=?][method=?]', card_sessions_path, 'post' do
      assert_select 'input[name=?]', 'card_session[title]'
      assert_select 'input[name=?]', 'card_session[user]'
    end
  end
end

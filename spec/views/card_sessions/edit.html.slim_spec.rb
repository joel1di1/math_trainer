require 'rails_helper'

RSpec.describe "card_sessions/edit", type: :view do
  before(:each) do
    @card_session = assign(:card_session, CardSession.create!(
      title: "MyString",
      user: nil
    ))
  end

  it "renders the edit card_session form" do
    render

    assert_select "form[action=?][method=?]", card_session_path(@card_session), "post" do

      assert_select "input[name=?]", "card_session[title]"

      assert_select "input[name=?]", "card_session[user_id]"
    end
  end
end

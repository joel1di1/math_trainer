require 'rails_helper'

RSpec.describe "card_sessions/index", type: :view do
  before(:each) do
    assign(:card_sessions, [
      CardSession.create!(
        title: "Title",
        user: nil
      ),
      CardSession.create!(
        title: "Title",
        user: nil
      )
    ])
  end

  it "renders a list of card_sessions" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end

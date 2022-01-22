require 'rails_helper'

RSpec.describe "time_sessions/new", type: :view do
  before(:each) do
    assign(:time_session, TimeSession.new(
      user: nil,
      minutes: 1,
      operation_types: "MyString",
      frequencies: "MyString"
    ))
  end

  it "renders new time_session form" do
    render

    assert_select "form[action=?][method=?]", time_sessions_path, "post" do

      assert_select "input[name=?]", "time_session[user_id]"

      assert_select "input[name=?]", "time_session[minutes]"

      assert_select "input[name=?]", "time_session[operation_types]"

      assert_select "input[name=?]", "time_session[frequencies]"
    end
  end
end

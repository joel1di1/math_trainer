require 'rails_helper'

RSpec.describe "time_sessions/edit", type: :view do
  before(:each) do
    @time_session = assign(:time_session, TimeSession.create!(
      user: nil,
      minutes: 1,
      operation_types: "MyString",
      frequencies: "MyString"
    ))
  end

  it "renders the edit time_session form" do
    render

    assert_select "form[action=?][method=?]", time_session_path(@time_session), "post" do

      assert_select "input[name=?]", "time_session[user_id]"

      assert_select "input[name=?]", "time_session[minutes]"

      assert_select "input[name=?]", "time_session[operation_types]"

      assert_select "input[name=?]", "time_session[frequencies]"
    end
  end
end

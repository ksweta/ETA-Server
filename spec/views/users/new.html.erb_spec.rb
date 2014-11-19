require 'rails_helper'

RSpec.describe "users/new", :type => :view do
  before(:each) do
    assign(:user, User.new(
      :firstName => "MyString",
      :lastName => "MyString",
      :email => "MyString",
      :password => "MyString",
      :phoneNumber => "MyString",
      :clientRegistrationId => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_firstName[name=?]", "user[firstName]"

      assert_select "input#user_lastName[name=?]", "user[lastName]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_password[name=?]", "user[password]"

      assert_select "input#user_phoneNumber[name=?]", "user[phoneNumber]"

      assert_select "input#user_clientRegistrationId[name=?]", "user[clientRegistrationId]"
    end
  end
end

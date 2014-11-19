require 'rails_helper'

RSpec.describe "users/edit", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :firstName => "MyString",
      :lastName => "MyString",
      :email => "MyString",
      :password => "MyString",
      :phoneNumber => "MyString",
      :clientRegistrationId => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_firstName[name=?]", "user[firstName]"

      assert_select "input#user_lastName[name=?]", "user[lastName]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_password[name=?]", "user[password]"

      assert_select "input#user_phoneNumber[name=?]", "user[phoneNumber]"

      assert_select "input#user_clientRegistrationId[name=?]", "user[clientRegistrationId]"
    end
  end
end

require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :firstName => "First Name",
        :lastName => "Last Name",
        :email => "Email",
        :password => "Password",
        :phoneNumber => "Phone Number",
        :clientRegistrationId => "Client Registration"
      ),
      User.create!(
        :firstName => "First Name",
        :lastName => "Last Name",
        :email => "Email",
        :password => "Password",
        :phoneNumber => "Phone Number",
        :clientRegistrationId => "Client Registration"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Client Registration".to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :firstName => "First Name",
      :lastName => "Last Name",
      :email => "Email",
      :password => "Password",
      :phoneNumber => "Phone Number",
      :clientRegistrationId => "Client Registration"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Client Registration/)
  end
end

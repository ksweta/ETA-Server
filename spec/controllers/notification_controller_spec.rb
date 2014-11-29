require 'rails_helper'

RSpec.describe NotificationController, :type => :controller do

  describe "GET sendETA" do
    it "returns http success" do
      get :sendETA
      expect(response).to have_http_status(:success)
    end
  end

end

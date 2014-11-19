require 'rails_helper'

RSpec.describe SendEtaController, :type => :controller do

  describe "GET sendMessage" do
    it "returns http success" do
      get :sendMessage
      expect(response).to have_http_status(:success)
    end
  end

end

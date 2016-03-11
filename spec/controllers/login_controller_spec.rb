require 'rails_helper'

RSpec.describe LoginController, type: :controller do

  describe "GET #submit" do
    it "returns http success" do
      get :submit
      expect(response).to have_http_status(:success)
    end
  end

end

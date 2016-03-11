require 'rails_helper'

RSpec.describe LogoutController, type: :controller do

  describe "GET #end" do
    it "returns http success" do
      get :end
      expect(response).to have_http_status(:success)
    end
  end

end

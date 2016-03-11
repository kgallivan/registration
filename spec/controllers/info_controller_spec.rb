require 'rails_helper'

RSpec.describe InfoController, type: :controller do

  describe "GET #display" do
    it "returns http success" do
      get :display
      expect(response).to have_http_status(:success)
    end
  end

end

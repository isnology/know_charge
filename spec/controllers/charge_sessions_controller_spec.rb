require 'rails_helper'

RSpec.describe ChargeSessionsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST #success" do
    context "with valid params" do
      it "creates a new ChargeSession" do
        expect {
          post :success, params: {charge_session: valid_attributes}, session: valid_session
        }.to change(ChargeSession, :count).by(1)
      end
    end
  end

end

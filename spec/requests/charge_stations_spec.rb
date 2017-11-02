require 'rails_helper'

RSpec.describe "ChargeStations", type: :request do
  describe "GET /charge_stations" do
    it "works! (now write some real specs)" do
      get charge_stations_path
      expect(response).to have_http_status(200)
    end
  end
end

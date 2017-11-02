require 'rails_helper'

RSpec.describe "AdapterPlugs", type: :request do
  describe "GET /adapter_plugs" do
    it "works! (now write some real specs)" do
      get adapter_plugs_path
      expect(response).to have_http_status(200)
    end
  end
end

require 'rails_helper'

RSpec.describe "Favourites", type: :request do
  describe "GET /favourites" do
    it "works! (now write some real specs)" do
      get favourites_path
      expect(response).to have_http_status(200)
    end
  end
end

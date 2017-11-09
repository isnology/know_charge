require "rails_helper"

RSpec.describe ChargeStationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/charge_stations").to route_to("charge_stations#index")
    end

    it "routes to #new" do
      expect(:get => "/charge_stations/new").to route_to("charge_stations#new")
    end

    it "routes to #show" do
      expect(:get => "/charge_stations/1").to route_to("charge_stations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/charge_stations/1/edit").to route_to("charge_stations#edit", :id => "1")
    end

    it "routes to #success" do
      expect(:post => "/charge_stations").to route_to("charge_stations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/charge_stations/1").to route_to("charge_stations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/charge_stations/1").to route_to("charge_stations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/charge_stations/1").to route_to("charge_stations#destroy", :id => "1")
    end

  end
end

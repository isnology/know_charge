require "rails_helper"

RSpec.describe AdapterPlugsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/adapter_plugs").to route_to("adapter_plugs#index")
    end

    it "routes to #new" do
      expect(:get => "/adapter_plugs/new").to route_to("adapter_plugs#new")
    end

    it "routes to #show" do
      expect(:get => "/adapter_plugs/1").to route_to("adapter_plugs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/adapter_plugs/1/edit").to route_to("adapter_plugs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/adapter_plugs").to route_to("adapter_plugs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/adapter_plugs/1").to route_to("adapter_plugs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/adapter_plugs/1").to route_to("adapter_plugs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/adapter_plugs/1").to route_to("adapter_plugs#destroy", :id => "1")
    end

  end
end

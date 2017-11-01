require 'rails_helper'

RSpec.describe "vehicles/index", type: :view do
  before(:each) do
    assign(:vehicles, [
      Vehicle.create!(
        :licence_plate => "Licence Plate",
        :make => "Make",
        :model => "Model",
        :colour => "Colour",
        :charger_kwh => 2.5,
        :drivers_licence_number => "Drivers Licence Number",
        :image_data => "MyText",
        :user => nil
      ),
      Vehicle.create!(
        :licence_plate => "Licence Plate",
        :make => "Make",
        :model => "Model",
        :colour => "Colour",
        :charger_kwh => 2.5,
        :drivers_licence_number => "Drivers Licence Number",
        :image_data => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of vehicles" do
    render
    assert_select "tr>td", :text => "Licence Plate".to_s, :count => 2
    assert_select "tr>td", :text => "Make".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "Colour".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "Drivers Licence Number".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

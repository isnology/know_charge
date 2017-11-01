require 'rails_helper'

RSpec.describe "vehicles/show", type: :view do
  before(:each) do
    @vehicle = assign(:vehicle, Vehicle.create!(
      :licence_plate => "Licence Plate",
      :make => "Make",
      :model => "Model",
      :colour => "Colour",
      :charger_kwh => 2.5,
      :drivers_licence_number => "Drivers Licence Number",
      :image_data => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Licence Plate/)
    expect(rendered).to match(/Make/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Colour/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Drivers Licence Number/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end

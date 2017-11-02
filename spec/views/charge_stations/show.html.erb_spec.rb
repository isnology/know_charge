require 'rails_helper'

RSpec.describe "charge_stations/show", type: :view do
  before(:each) do
    @charge_station = assign(:charge_station, ChargeStation.create!(
      :street_number => "Street Number",
      :street => "Street",
      :city => "City",
      :postcode => "Postcode",
      :state => "State",
      :charge_kwh => 2.5,
      :adapter => nil,
      :days_of_week => "Days Of Week",
      :price_kwh_cents => "",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Street Number/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Postcode/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Days Of Week/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

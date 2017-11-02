require 'rails_helper'

RSpec.describe "charge_stations/index", type: :view do
  before(:each) do
    assign(:charge_stations, [
      ChargeStation.create!(
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
      ),
      ChargeStation.create!(
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
      )
    ])
  end

  it "renders a list of charge_stations" do
    render
    assert_select "tr>td", :text => "Street Number".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Days Of Week".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

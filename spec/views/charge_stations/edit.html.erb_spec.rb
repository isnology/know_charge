require 'rails_helper'

RSpec.describe "charge_stations/edit", type: :view do
  before(:each) do
    @charge_station = assign(:charge_station, ChargeStation.create!(
      :street_number => "MyString",
      :street => "MyString",
      :city => "MyString",
      :postcode => "MyString",
      :state => "MyString",
      :charge_kwh => 1.5,
      :adapter => nil,
      :days_of_week => "MyString",
      :price_kwh_cents => "",
      :user => nil
    ))
  end

  it "renders the edit charge_station form" do
    render

    assert_select "form[action=?][method=?]", charge_station_path(@charge_station), "post" do

      assert_select "input[name=?]", "charge_station[street_number]"

      assert_select "input[name=?]", "charge_station[street]"

      assert_select "input[name=?]", "charge_station[city]"

      assert_select "input[name=?]", "charge_station[postcode]"

      assert_select "input[name=?]", "charge_station[state]"

      assert_select "input[name=?]", "charge_station[charge_kwh]"

      assert_select "input[name=?]", "charge_station[adapter_id]"

      assert_select "input[name=?]", "charge_station[days_of_week]"

      assert_select "input[name=?]", "charge_station[price_kwh_cents]"

      assert_select "input[name=?]", "charge_station[user_id]"
    end
  end
end

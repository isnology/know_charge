require 'rails_helper'

RSpec.describe "bookings/edit", type: :view do
  before(:each) do
    @booking = assign(:booking, Booking.create!(
      :name => "MyString",
      :price_cents => 1,
      :vehicle => nil,
      :charge_station => nil
    ))
  end

  it "renders the edit booking form" do
    render

    assert_select "form[action=?][method=?]", booking_path(@booking), "post" do

      assert_select "input[name=?]", "booking[name]"

      assert_select "input[name=?]", "booking[price_cents]"

      assert_select "input[name=?]", "booking[vehicle_id]"

      assert_select "input[name=?]", "booking[charge_station_id]"
    end
  end
end

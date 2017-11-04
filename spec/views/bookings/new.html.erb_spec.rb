require 'rails_helper'

RSpec.describe "bookings/new", type: :view do
  before(:each) do
    assign(:booking, Booking.new(
      :name => "MyString",
      :price_cents => 1,
      :vehicle => nil,
      :charge_station => nil
    ))
  end

  it "renders new booking form" do
    render

    assert_select "form[action=?][method=?]", bookings_path, "post" do

      assert_select "input[name=?]", "booking[name]"

      assert_select "input[name=?]", "booking[price_cents]"

      assert_select "input[name=?]", "booking[vehicle_id]"

      assert_select "input[name=?]", "booking[charge_station_id]"
    end
  end
end

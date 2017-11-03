require 'rails_helper'

RSpec.describe "bookings/index", type: :view do
  before(:each) do
    assign(:bookings, [
      Booking.create!(
        :duration => 2,
        :price_cents => 3,
        :vehicle => nil,
        :charge_station => nil
      ),
      Booking.create!(
        :duration => 2,
        :price_cents => 3,
        :vehicle => nil,
        :charge_station => nil
      )
    ])
  end

  it "renders a list of bookings" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

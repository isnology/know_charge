require 'rails_helper'

RSpec.describe "vehicles/edit", type: :view do
  before(:each) do
    @vehicle = assign(:vehicle, Vehicle.create!(
      :licence_plate => "MyString",
      :make => "MyString",
      :model => "MyString",
      :colour => "MyString",
      :charger_kwh => 1.5,
      :drivers_licence_number => "MyString",
      :image_data => "MyText",
      :user => nil
    ))
  end

  it "renders the edit vehicle form" do
    render

    assert_select "form[action=?][method=?]", vehicle_path(@vehicle), "post" do

      assert_select "input[name=?]", "vehicle[licence_plate]"

      assert_select "input[name=?]", "vehicle[make]"

      assert_select "input[name=?]", "vehicle[model]"

      assert_select "input[name=?]", "vehicle[colour]"

      assert_select "input[name=?]", "vehicle[charger_kwh]"

      assert_select "input[name=?]", "vehicle[drivers_licence_number]"

      assert_select "textarea[name=?]", "vehicle[image_data]"

      assert_select "input[name=?]", "vehicle[user_id]"
    end
  end
end

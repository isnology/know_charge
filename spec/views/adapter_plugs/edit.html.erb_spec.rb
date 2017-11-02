require 'rails_helper'

RSpec.describe "adapter_plugs/edit", type: :view do
  before(:each) do
    @adapter_plug = assign(:adapter_plug, AdapterPlug.create!(
      :adapter => nil,
      :charge_station => nil
    ))
  end

  it "renders the edit adapter_plug form" do
    render

    assert_select "form[action=?][method=?]", adapter_plug_path(@adapter_plug), "post" do

      assert_select "input[name=?]", "adapter_plug[adapter_id]"

      assert_select "input[name=?]", "adapter_plug[charge_station_id]"
    end
  end
end

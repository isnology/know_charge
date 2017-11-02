require 'rails_helper'

RSpec.describe "adapter_plugs/new", type: :view do
  before(:each) do
    assign(:adapter_plug, AdapterPlug.new(
      :adapter => nil,
      :charge_station => nil
    ))
  end

  it "renders new adapter_plug form" do
    render

    assert_select "form[action=?][method=?]", adapter_plugs_path, "post" do

      assert_select "input[name=?]", "adapter_plug[adapter_id]"

      assert_select "input[name=?]", "adapter_plug[charge_station_id]"
    end
  end
end

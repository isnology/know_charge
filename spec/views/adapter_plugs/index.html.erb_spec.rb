require 'rails_helper'

RSpec.describe "adapter_plugs/index", type: :view do
  before(:each) do
    assign(:adapter_plugs, [
      AdapterPlug.create!(
        :adapter => nil,
        :charge_station => nil
      ),
      AdapterPlug.create!(
        :adapter => nil,
        :charge_station => nil
      )
    ])
  end

  it "renders a list of adapter_plugs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

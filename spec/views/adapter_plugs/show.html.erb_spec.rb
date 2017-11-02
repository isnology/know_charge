require 'rails_helper'

RSpec.describe "adapter_plugs/show", type: :view do
  before(:each) do
    @adapter_plug = assign(:adapter_plug, AdapterPlug.create!(
      :adapter => nil,
      :charge_station => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

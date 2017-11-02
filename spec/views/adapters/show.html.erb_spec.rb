require 'rails_helper'

RSpec.describe "adapters/show", type: :view do
  before(:each) do
    @adapter = assign(:adapter, Adapter.create!(
      :to_plug => "To Plug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/To Plug/)
  end
end

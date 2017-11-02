require 'rails_helper'

RSpec.describe "adapters/index", type: :view do
  before(:each) do
    assign(:adapters, [
      Adapter.create!(
        :to_plug => "To Plug"
      ),
      Adapter.create!(
        :to_plug => "To Plug"
      )
    ])
  end

  it "renders a list of adapters" do
    render
    assert_select "tr>td", :text => "To Plug".to_s, :count => 2
  end
end

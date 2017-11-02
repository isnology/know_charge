require 'rails_helper'

RSpec.describe "adapters/edit", type: :view do
  before(:each) do
    @adapter = assign(:adapter, Adapter.create!(
      :to_plug => "MyString"
    ))
  end

  it "renders the edit adapter form" do
    render

    assert_select "form[action=?][method=?]", adapter_path(@adapter), "post" do

      assert_select "input[name=?]", "adapter[to_plug]"
    end
  end
end

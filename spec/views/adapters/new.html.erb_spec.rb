require 'rails_helper'

RSpec.describe "adapters/new", type: :view do
  before(:each) do
    assign(:adapter, Adapter.new(
      :to_plug => "MyString"
    ))
  end

  it "renders new adapter form" do
    render

    assert_select "form[action=?][method=?]", adapters_path, "post" do

      assert_select "input[name=?]", "adapter[to_plug]"
    end
  end
end

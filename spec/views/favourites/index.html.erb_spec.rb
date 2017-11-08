require 'rails_helper'

RSpec.describe "favourites/index", type: :view do
  before(:each) do
    assign(:favourites, [
      Favourite.create!(
        :booking => nil
      ),
      Favourite.create!(
        :booking => nil
      )
    ])
  end

  it "renders a list of favourites" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

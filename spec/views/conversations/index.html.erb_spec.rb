require 'rails_helper'

RSpec.describe "conversations/index", type: :view do
  before(:each) do
    assign(:conversations, [
      Conversation.create!(
        :charge_station => nil,
        :user => nil
      ),
      Conversation.create!(
        :charge_station => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of conversations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

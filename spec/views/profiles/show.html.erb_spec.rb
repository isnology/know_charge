require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :street_number => "Street Number",
      :street => "Street",
      :city => "City",
      :state => "State",
      :image_data => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Street Number/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end

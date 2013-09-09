require 'spec_helper'

describe "locations/index" do
  before(:each) do
    assign(:locations, [
      stub_model(Location,
        :name => "Name",
        :address_line_1 => "Address Line 1",
        :address_line_2 => "Address Line 2",
        :town_city => "Town City",
        :county => "County",
        :postcode => "Postcode",
        :country => "Country",
        :organization_id => 1
      ),
      stub_model(Location,
        :name => "Name",
        :address_line_1 => "Address Line 1",
        :address_line_2 => "Address Line 2",
        :town_city => "Town City",
        :county => "County",
        :postcode => "Postcode",
        :country => "Country",
        :organization_id => 1
      )
    ])
  end

  it "renders a list of locations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address Line 1".to_s, :count => 2
    assert_select "tr>td", :text => "Address Line 2".to_s, :count => 2
    assert_select "tr>td", :text => "Town City".to_s, :count => 2
    assert_select "tr>td", :text => "County".to_s, :count => 2
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

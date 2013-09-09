require 'spec_helper'

describe "locations/new" do
  before(:each) do
    assign(:location, stub_model(Location,
      :name => "MyString",
      :address_line_1 => "MyString",
      :address_line_2 => "MyString",
      :town_city => "MyString",
      :county => "MyString",
      :postcode => "MyString",
      :country => "MyString",
      :organization_id => 1
    ).as_new_record)
  end

  it "renders new location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", locations_path, "post" do
      assert_select "input#location_name[name=?]", "location[name]"
      assert_select "input#location_address_line_1[name=?]", "location[address_line_1]"
      assert_select "input#location_address_line_2[name=?]", "location[address_line_2]"
      assert_select "input#location_town_city[name=?]", "location[town_city]"
      assert_select "input#location_county[name=?]", "location[county]"
      assert_select "input#location_postcode[name=?]", "location[postcode]"
      assert_select "input#location_country[name=?]", "location[country]"
      assert_select "input#location_organization_id[name=?]", "location[organization_id]"
    end
  end
end

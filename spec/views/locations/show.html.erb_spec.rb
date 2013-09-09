require 'spec_helper'

describe "locations/show" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :name => "Name",
      :address_line_1 => "Address Line 1",
      :address_line_2 => "Address Line 2",
      :town_city => "Town City",
      :county => "County",
      :postcode => "Postcode",
      :country => "Country",
      :organization_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Address Line 1/)
    rendered.should match(/Address Line 2/)
    rendered.should match(/Town City/)
    rendered.should match(/County/)
    rendered.should match(/Postcode/)
    rendered.should match(/Country/)
    rendered.should match(/1/)
  end
end

require 'spec_helper'

describe "rooms/edit" do
  before(:each) do
    @room = assign(:room, stub_model(Room,
      :name => "MyString",
      :price_per_hour => "9.99",
      :location_id => 1,
      :organization_id => 1,
      :people_capacity => 1
    ))
  end

  it "renders the edit room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", room_path(@room), "post" do
      assert_select "input#room_name[name=?]", "room[name]"
      assert_select "input#room_price_per_hour[name=?]", "room[price_per_hour]"
      assert_select "input#room_location_id[name=?]", "room[location_id]"
      assert_select "input#room_organization_id[name=?]", "room[organization_id]"
      assert_select "input#room_people_capacity[name=?]", "room[people_capacity]"
    end
  end
end

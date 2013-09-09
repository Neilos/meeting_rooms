require 'spec_helper'

describe "custom_attributes/edit" do
  before(:each) do
    @custom_attribute = assign(:custom_attribute, stub_model(CustomAttribute,
      :name => "MyString",
      :value => "MyString",
      :room_id => 1
    ))
  end

  it "renders the edit custom_attribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", custom_attribute_path(@custom_attribute), "post" do
      assert_select "input#custom_attribute_name[name=?]", "custom_attribute[name]"
      assert_select "input#custom_attribute_value[name=?]", "custom_attribute[value]"
      assert_select "input#custom_attribute_room_id[name=?]", "custom_attribute[room_id]"
    end
  end
end

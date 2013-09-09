require 'spec_helper'

describe "custom_attributes/index" do
  before(:each) do
    assign(:custom_attributes, [
      stub_model(CustomAttribute,
        :name => "Name",
        :value => "Value",
        :room_id => 1
      ),
      stub_model(CustomAttribute,
        :name => "Name",
        :value => "Value",
        :room_id => 1
      )
    ])
  end

  it "renders a list of custom_attributes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

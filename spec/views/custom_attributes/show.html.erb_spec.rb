require 'spec_helper'

describe "custom_attributes/show" do
  before(:each) do
    @custom_attribute = assign(:custom_attribute, stub_model(CustomAttribute,
      :name => "Name",
      :value => "Value",
      :room_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Value/)
    rendered.should match(/1/)
  end
end

require 'spec_helper'

describe "permission_sets/show" do
  before(:each) do
    @permission_set = assign(:permission_set, stub_model(PermissionSet,
      :create__organizations => false,
      :create__memberships => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end

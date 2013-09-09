require 'spec_helper'

describe "permission_sets/edit" do
  before(:each) do
    @permission_set = assign(:permission_set, stub_model(PermissionSet,
      :create__organizations => false,
      :create__memberships => false
    ))
  end

  it "renders the edit permission_set form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", permission_set_path(@permission_set), "post" do
      assert_select "input#permission_set_create__organizations[name=?]", "permission_set[create__organizations]"
      assert_select "input#permission_set_create__memberships[name=?]", "permission_set[create__memberships]"
    end
  end
end

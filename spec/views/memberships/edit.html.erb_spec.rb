require 'spec_helper'

describe "memberships/edit" do
  before(:each) do
    @membership = assign(:membership, stub_model(Membership,
      :user_id => 1,
      :organization_id => 1,
      :permission_set_id => 1
    ))
  end

  it "renders the edit membership form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", membership_path(@membership), "post" do
      assert_select "input#membership_user_id[name=?]", "membership[user_id]"
      assert_select "input#membership_organization_id[name=?]", "membership[organization_id]"
      assert_select "input#membership_permission_set_id[name=?]", "membership[permission_set_id]"
    end
  end
end

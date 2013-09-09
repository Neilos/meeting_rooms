require 'spec_helper'

describe "memberships/index" do
  before(:each) do
    assign(:memberships, [
      stub_model(Membership,
        :user_id => 1,
        :organization_id => 2,
        :permission_set_id => 3
      ),
      stub_model(Membership,
        :user_id => 1,
        :organization_id => 2,
        :permission_set_id => 3
      )
    ])
  end

  it "renders a list of memberships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end

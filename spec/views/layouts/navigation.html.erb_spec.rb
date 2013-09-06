require 'spec_helper'

describe "layouts/navigation.html.erb" do

  it "shows the brand" do
    render :partial => 'layouts/navigation'
    rendered.should include("Takeout-Terro")
  end

  context "when user not logged in" do
    it "shows " do
      render :partial => 'layouts/navigation'
      rendered.should include("Login")
      rendered.should include("Sign up")
    end
  end

  context "when user is logged in" do
    it "shows " do
      @signed_in_user = FactoryGirl.create(:user, :email => "dave@dave.com")
      sign_in @signed_in_user
      render :partial => 'layouts/navigation'
      rendered.should include("Logout")
      rendered.should include("Edit account")
    end
  end

end

require 'spec_helper'

feature "viewing user memberships" do

	 before :each do 
    @password = "password"
    @user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
    @organization = FactoryGirl.create(:organization, :name => "TechHub")
    @organization2 = FactoryGirl.create(:organization, :name => "New Bamboo")
    @permission_set = FactoryGirl.create(:permission_set)
    @membership = FactoryGirl.create(:membership, organization_id: @organization.id, user_id: @user.id, permission_set_id: @permission_set.id)
    log_in_with email: @user.email, password: @password
  end

  scenario "from the user showpage" do
    expect(page).to have_content "TechHub"
    expect(page).to have_no_content "New Bamboo"
  end

end
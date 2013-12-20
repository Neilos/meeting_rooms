require 'spec_helper'

feature "viewing organization members" do

	before :each do 
    @password = "password"
    @user = FactoryGirl.create(:user, name: "Dave Dave", email: "user1@email.com", password: @password, password_confirmation: @password)
    @user2 = FactoryGirl.create(:user, name: "Mike Mike", email: "user2@email.com", password: @password, password_confirmation: @password)

    @organization = FactoryGirl.create(:organization, :name => "TechHub")
    @permission_set = FactoryGirl.create(:permission_set)
    @membership = FactoryGirl.create(:membership, organization_id: @organization.id, user_id: @user.id, permission_set_id: @permission_set.id)
    @membership2 = FactoryGirl.create(:membership, organization_id: @organization.id, user_id: @user2.id, permission_set_id: @permission_set.id)
    log_in_with email: @user.email, password: @password
  end

  scenario "from the organization showpage" do
  	visit "/organizations/#{@organization.id}"
  	expect(page).to have_content "Members"
    expect(page).to have_content "Dave Dave"
    expect(page).to have_content "Mike Mike"
  end

end

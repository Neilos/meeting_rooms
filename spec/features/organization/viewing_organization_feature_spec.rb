require 'spec_helper'

feature "viewing_organization" do

	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization1 = Organization.create(:name => "techhub")
		@organization2 = Organization.create(:name => "New Bamboo")
		@permission_set = FactoryGirl.create(:permission_set)
		@membership1 = Membership.create(organization_id: @organization1.id, user_id: @user.id, permission_set_id: @permission_set.id)
		@membership2 = Membership.create(organization_id: @organization2.id, user_id: @user.id, permission_set_id: @permission_set.id)
		log_in_with email: @user.email, password: @password
	end

	scenario "via the memberships page" do
		within(".navbar") do
			click_link('My Organizations')
		end
		within("#memberships-table") do
			click_link "techhub"
		end
		page.should have_content('techhub')
		page.should_not have_content('New Bamboo')
	end

end
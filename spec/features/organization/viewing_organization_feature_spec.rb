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
		sign_in_with email: @user.email, password: @password
	end

	scenario "via the user#show page" do
		page.first(:link, 'Organization Details').click
		page.should have_content('techhub')
		page.should_not have_content('New Bamboo')
	end

	scenario "via the organizations page" do
		within(".navbar") do
			click_link('Organizations')
		end
		within(".table") do 
			page.first(:link, 'View').click
		end
		page.should have_content('techhub')
		page.should_not have_content('New Bamboo')
	end
end
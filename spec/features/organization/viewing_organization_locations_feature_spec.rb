require 'spec_helper'

feature "viewing organization locations" do
	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create(:name => "techhub")
		@location1 = FactoryGirl.create(:location, organization_id: @organization.id, name: "Old Street")
		@location2 = FactoryGirl.create(:location2, organization_id: @organization.id, name: "White City")
		log_in_with email: @user.email, password: @password
	end

	scenario "by clicking organizations link in NavBar" do
		within(".navbar") do
			click_link('Organizations')
		end
		page.should have_content('techhub')
		within(".table") do 
			page.first(:link, 'View').click
		end
		click_link 'Locations'
		page.should have_content('Old Street')
		page.should have_content('White City')
	end
end
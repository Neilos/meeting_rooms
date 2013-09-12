require 'spec_helper'

feature "viewing location" do
	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create(:name => "techhub")
		@location1 = FactoryGirl.create(:location, organization_id: @organization.id, name: "Old Street")
		@location2 = FactoryGirl.create(:location2, organization_id: @organization.id, name: "White City")
		sign_in_with email: @user.email, password: @password
	end

	scenario "via the organization#show page" do
		within(".navbar") do
			click_link('Organizations')
		end
		within("#organizations-table") do 
			page.first(:link, 'View').click
		end
		within("#locations-table") do 
			page.first(:link, 'View').click
		end
		expect(page).to have_content @location1.address_line_1
		expect(page).to have_content @location1.address_line_2
		expect(page).to have_content @location1.postcode
		click_link 'Back'
		expect(page).to have_content 'techhub'
  	expect(page).to have_selector '#organization-details'
 	 	expect(page).to have_selector '#locations-table'
 		within('#locations-table') do
 	  	page.should have_content('Old Street')
  	end
	end
end
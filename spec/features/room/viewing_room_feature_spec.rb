require 'spec_helper'

feature "viewing room" do
	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create(:name => "techhub")
		@location = FactoryGirl.create(:location, organization_id: @organization.id, name: "Old Street")
		@room = FactoryGirl.create(:room, organization_id: @organization.id, name: "Room 1", location_id: @location.id)
		sign_in_with email: @user.email, password: @password
	end

	scenario "via the organization#show page" do
		within(".navbar") do
			click_link('Organizations')
		end
		within("#organizations-table") do 
			page.first(:link, 'View').click
		end
		within("#rooms-table") do 
			page.first(:link, 'View').click
		end
		expect(page).to have_content @room.price_per_hour
		expect(page).to have_content @room.people_capacity
		expect(page).to have_content @room.name
		click_link 'Back'
		expect(page).to have_content 'techhub'
  	expect(page).to have_selector '#organization-details'
 	 	expect(page).to have_selector '#rooms-table'
 		within('#rooms-table') do
 	  	page.should have_content(@room.name)
  	end
	end
end
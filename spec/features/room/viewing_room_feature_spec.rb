require 'spec_helper'

feature "viewing room" do
	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create(:name => "techhub")
		@location = FactoryGirl.create(:location, organization_id: @organization.id, name: "Old Street")
		@room = FactoryGirl.create(:room, organization_id: @organization.id, name: "Room 1", location_id: @location.id)
		@custom_attribute = FactoryGirl.create(:custom_attribute, room_id: @room.id)
		@custom_attribute2 = FactoryGirl.create(:custom_attribute, room_id: @room.id, name: "wifi", value: "yes")
		sign_in_with email: @user.email, password: @password
	end

	scenario "via the organization#show page" do
		visit_show_page_of_first_organization_in_organizations_table
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
		expect(page).to have_content @custom_attribute.value
		expect(page).to have_content @custom_attribute.name
		expect(page).to have_content @custom_attribute2.value
		expect(page).to have_content @custom_attribute2.name
		click_link 'Back'
		expect(page).to have_content 'techhub'
  	expect(page).to have_selector '#organization-details'
 	 	expect(page).to have_selector '#rooms-table'
 		within('#rooms-table') do
 	  	page.should have_content(@room.name)
  	end
	end

end
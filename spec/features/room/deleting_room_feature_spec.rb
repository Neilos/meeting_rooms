 require 'spec_helper'

feature "deleting room" do

	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create(:name => "techhub")
		@location = FactoryGirl.create(:location, organization_id: @organization.id)
		@room1 = FactoryGirl.create(:room_with_calendar, organization_id: @organization.id, name: "Room 1", location_id: @location.id)
		@room2 = FactoryGirl.create(:room_with_calendar, organization_id: @organization.id, name: "Room 99", location_id: @location.id)
		log_in_with email: @user.email, password: @password
	end

	scenario "from the organization#show page", js: true do
		within(".navbar") do
			click_link('Organizations')
		end
		within("#organizations-table") do
			page.first(:link, 'View').click
		end
		within("#rooms-table") do
			page.first(:link, 'Delete').click
		end
		page.driver.browser.switch_to.alert.accept
		expect(page).to have_content 'Room was successfully deleted.'
    expect(page).to have_content 'techhub'
    expect(page).to have_selector '#organization-details'
    click_link 'Rooms'
    expect(page).to have_selector '#rooms-table'
    within('#rooms-table') do 
      page.should_not have_content('Room 1')
    end
	end

	scenario "from the room show page", js: true do 
		within(".navbar") do
			click_link('Organizations')
		end
		within("#organizations-table") do
			page.first(:link, 'View').click
		end
		within("#rooms-table") do
			page.first(:link, 'View').click
		end
		click_link('Delete')
		page.driver.browser.switch_to.alert.accept
		expect(page).to have_content 'Room was successfully deleted.'
    expect(page).to have_content 'techhub'
    expect(page).to have_selector '#organization-details'
    click_link 'Rooms'
    expect(page).to have_selector '#rooms-table'
    within('#rooms-table') do 
      page.should_not have_content('Room 1')
    end
	end
end
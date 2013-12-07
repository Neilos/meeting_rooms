require 'spec_helper'

feature "deleting custom attribute", :js => true do
	
  before :each do 
    @password = "password"
    @user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
    @organization = Organization.create(:name => "techhub")
    @location = FactoryGirl.create(:location, organization_id: @organization.id, name: "Old Street")
    @room_attributes = {name: "Room 1", price_per_hour: "9.99", people_capacity: "10", location_name: @location.name}
    log_in_with email: @user.email, password: @password
  end

  scenario "when creating a room" do
    fill_in_new_room_form(@room_attributes)
    click_button "New attribute"
    within('#custom_attributes_section') do
      fill_in "Name", :with => "wifi"
      fill_in "Value", :with => "yes there is wifi"
      click_link "Delete attribute"
    end
    click_button 'Create Room'
    expect(page).to have_content 'Room was successfully created'
    expect(page).to have_content @organization.name
    expect(page).to have_selector '#organization-details'
    click_link 'Rooms'
    expect(page).to have_selector '#rooms-table'
    within('#rooms-table') do
      page.first(:link, 'View').click
    end
    expect(page).to have_no_content 'wifi'
    expect(page).to have_no_content 'yes there is wifi'
  end

  scenario "when editing a room" do
    room = FactoryGirl.create(:room, organization_id: @organization.id, name: "Room 1", location_id: @location.id)
    edit_first_room_in_rooms_table
    click_button "New attribute"
    within('#custom_attributes_section') do
      fill_in "Name", :with => "wifi"
      fill_in "Value", :with => "yes there is wifi"
      click_link "Delete attribute"
    end
    click_button 'Update Room'
    expect(page).to have_content @organization.name
    expect(page).to have_selector '#organization-details'
    click_link 'Rooms'
    expect(page).to have_selector '#rooms-table'
    within('#rooms-table') do
      page.first(:link, 'View').click
    end
    expect(page).to have_no_content 'wifi'
    expect(page).to have_no_content 'yes there is wifi'
  end
end
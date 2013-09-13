require 'spec_helper'

feature "editing custom attributes", :js => true do

  before :each do 
    @password = "password"
    @user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
    @organization = Organization.create(:name => "techhub")
    @location = FactoryGirl.create(:location, organization_id: @organization.id, name: "Old Street")
    @room = FactoryGirl.create(:room, organization_id: @organization.id, name: "Room 1", location_id: @location.id)
    @custom_attribute = @room.custom_attributes.create(:name => 'toilets', :value => '1 toilet')
    sign_in_with email: @user.email, password: @password
  end

  scenario "when editing a room" do
    edit_first_room_in_rooms_table
    within('#custom_attributes_section') do
      fill_in "Name", :with => "number of toilets"
      fill_in "Value", :with => "3 toilets"
    end
    click_button 'Update Room'
    expect(page).to have_content @organization.name
    expect(page).to have_selector '#organization-details'
    expect(page).to have_selector '#rooms-table'
    within('#rooms-table') do
      page.first(:link, 'View').click
    end
    expect(page).to have_no_content '1 toilet'
    expect(page).to have_content 'number of toilets'
    expect(page).to have_content '3 toilets'
  end

end
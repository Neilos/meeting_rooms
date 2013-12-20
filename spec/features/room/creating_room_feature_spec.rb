require 'spec_helper'

feature "creating room" do

	before :each do 
    @password = "password"
    @user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
    @organization = Organization.create(:name => "techhub")
    @location1 = FactoryGirl.create(:location, organization_id: @organization.id, name: "Old Street")
		@location2 = FactoryGirl.create(:location, organization_id: @organization.id, name: "White City")
    log_in_with email: @user.email, password: @password
    visit organization_path(@organization)
  end

  context "completing the creation of a room" do

    context "with valid details" do

      scenario "from the organizations#show page" do
  	    click_link 'New Room'
        within('#room-fields') do
          fill_in ('Name'), :with => 'Room 1'
        end
  	    select(@location1.name, :from => 'Location')
  	    fill_in 'Price per hour', :with => '3.99'
  			fill_in 'People capacity', :with => '12'
        fill_in 'Calendar color', :with => 'red'
  	    click_button 'Create Room'
  	    expect(page).to have_content 'Room was successfully created'
  	    expect(page).to have_content 'techhub'
  	    expect(page).to have_selector '#organization-details'
  	    expect(page).to have_selector '#rooms-table'
  	    within('#rooms-table') do
  	      expect(page).to have_content 'Room 1'
  	      expect(page).to have_content @location1.name
  	    end
  	  end

  	end

  	context "with INvalid/missing details" do

  		scenario "from the organizations#show page" do
  	    click_link 'New Room'
  	    click_button 'Create Room'
  	    expect(page).to have_content 'errors prohibited this room from being saved'
  	    expect(page).to have_content 'New Room'
  	  end

  	end

  end

  context "cancelling the creation of a room" do

    scenario "from the organizations#show page" do
      click_link 'New Room'
      click_link('Back')
      expect(page).to have_content 'techhub'
      expect(page).to have_selector '#organization-details'
      expect(page).to have_selector '#rooms-table'
    end

  end

end
require 'spec_helper'

feature "editing room" do
	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create(:name => "techhub")
		@location = FactoryGirl.create(:location, organization_id: @organization.id, name: "Old Street")
		@room = FactoryGirl.create(:room, organization_id: @organization.id, name: "Room 1", location_id: @location.id)
		sign_in_with email: @user.email, password: @password
	end


	context "completing an update" do
		context "with valid details" do
			scenario "via the organizations#show page" do
				within(".navbar") do
					click_link('Organizations')
				end
				within("#organizations-table") do 
					page.first(:link, 'View').click
				end
				within("#rooms-table") do 
					page.first(:link, 'Edit').click
				end
				fill_in 'Name', :with => 'NewName'
				click_button('Update Room')
				expect(page).to have_content('Room was successfully updated.')
				expect(page).to have_content 'techhub'
	    	expect(page).to have_selector '#organization-details'
	   	 	expect(page).to have_selector '#rooms-table'
	   		within('#rooms-table') do 
	   			page.should have_content('NewName')
	   	  	page.should_not have_content('Room 1')
	    	end
			end

			scenario "via the rooms#show page" do
				within(".navbar") do
					click_link('Organizations')
				end
				within("#organizations-table") do 
					page.first(:link, 'View').click
				end
				within("#rooms-table") do 
					page.first(:link, 'View').click
				end
				click_link 'Edit'
				fill_in 'Name', :with => 'NewName'
				click_button('Update Room')
				expect(page).to have_content('Room was successfully updated.')
				expect(page).to have_content 'techhub'
	    	expect(page).to have_selector '#organization-details'
	   	 	expect(page).to have_selector '#rooms-table'
	   		within('#rooms-table') do 
	   			page.should have_content('NewName')
	   	  	page.should_not have_content('Room 1')
	    	end
			end
		end

    context "with INvalid/missing details" do
      scenario "from the organizations#show page" do
				within(".navbar") do
					click_link('Organizations')
				end
				within("#organizations-table") do 
					page.first(:link, 'View').click
				end
				within("#rooms-table") do 
					page.first(:link, 'View').click
				end
				click_link 'Edit'
				fill_in 'Name', :with => ''
				click_button('Update Room')
        expect(page).to have_content 'error prohibited this room from being saved:'
        expect(page).to have_content 'Edit Room'
      end
    end
	end

	context "cancelling the update" do
		scenario "via the organizations#show page" do
			within(".navbar") do
				click_link('Organizations')
			end
			within("#organizations-table") do 
				page.first(:link, 'View').click
			end
			within("#rooms-table") do 
				page.first(:link, 'Edit').click
			end
			click_link 'Cancel'
			expect(page).to have_content 'techhub'
    	expect(page).to have_selector '#organization-details'
   	 	expect(page).to have_selector '#rooms-table'
   		within('#rooms-table') do
   	  	page.should have_content('Room 1')
    	end
		end

		scenario "via the rooms#show page" do
			within(".navbar") do
				click_link('Organizations')
			end
			within("#organizations-table") do 
				page.first(:link, 'View').click
			end
			within("#rooms-table") do 
				page.first(:link, 'View').click
			end
			click_link 'Edit'
			click_link 'Cancel'
			expect(page).to have_content 'techhub'
    	expect(page).to have_selector '#organization-details'
   	 	expect(page).to have_selector '#rooms-table'
   		within('#rooms-table') do
   	  	page.should have_content('Room 1')
    	end
		end
	end
end
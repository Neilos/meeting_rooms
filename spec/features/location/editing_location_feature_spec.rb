require 'spec_helper'

feature "editing location" do
	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create(:name => "techhub")
		@location1 = FactoryGirl.create(:location, organization_id: @organization.id, name: "Old Street")
		@location2 = FactoryGirl.create(:location, organization_id: @organization.id, name: "White City")
		log_in_with email: @user.email, password: @password
	end

	context "completing an update" do
		context "with valid details" do
			scenario "via the organizations#show page" do
				visit organization_path(@organization)
				click_link 'Locations'
				within("#locations-table") do 
					page.first(:link, 'Edit').click
				end
				fill_in 'Name', :with => 'NewName'
				click_button('Update Location')
				expect(page).to have_content('Location was successfully updated.')
				expect(page).to have_content 'techhub'
	    	expect(page).to have_selector '#organization-details'
	    	click_link 'Locations'
	   	 	expect(page).to have_selector '#locations-table'
	   		within('#locations-table') do 
	   			page.should have_content('NewName')
	   	  	page.should_not have_content('Old Street')
	    	end
			end

			scenario "via the locations#show page" do
				visit organization_path(@organization)
				click_link 'Locations'
				within("#locations-table") do 
					page.first(:link, 'View').click
				end
				click_link 'Edit'
				fill_in 'Name', :with => 'NewName'
				click_button('Update Location')
				expect(page).to have_content('Location was successfully updated.')
				expect(page).to have_content 'techhub'
	    	expect(page).to have_selector '#organization-details'
	    	click_link 'Locations'
	   	 	expect(page).to have_selector '#locations-table'
	   		within('#locations-table') do 
	   			page.should have_content('NewName')
	   	  	page.should_not have_content('Old Street')
	    	end
			end
		end

    context "with INvalid/missing details" do
      scenario "from the organizations#show page" do
				visit organization_path(@organization)
				click_link 'Locations'
				within("#locations-table") do 
					page.first(:link, 'View').click
				end
				click_link 'Edit'
				fill_in 'Name', :with => ''
				click_button('Update Location')
        expect(page).to have_content 'error prohibited this location from being saved:'
        expect(page).to have_content 'Edit Location'
      end
    end
	end

	context "cancelling the update" do
		scenario "via the organizations#show page" do
			visit organization_path(@organization)
			click_link 'Locations'
			within("#locations-table") do 
				page.first(:link, 'Edit').click
			end
			click_link('Back')
			expect(page).to have_content 'techhub'
    	expect(page).to have_selector '#organization-details'
    	click_link 'Locations'
   	 	expect(page).to have_selector '#locations-table'
   		within('#locations-table') do
   	  	page.should have_content('Old Street')
    	end
		end

		scenario "via the locations#show page" do
			visit organization_path(@organization)
			click_link 'Locations'
			within("#locations-table") do 
				page.first(:link, 'View').click
			end
			click_link 'Edit'
			click_link('Back')
			expect(page).to have_content 'techhub'
			expect(page).not_to have_selector '#organization-details' # not the organization page
		end
	end
end
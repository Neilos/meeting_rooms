require 'spec_helper'

feature "editing location" do
	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create(:name => "techhub")
		@location1 = FactoryGirl.create(:location, organization_id: @organization.id, name: "Old Street")
		@location2 = FactoryGirl.create(:location2, organization_id: @organization.id, name: "White City")
		sign_in_with email: @user.email, password: @password
	end

	context "completing an update" do
		scenario "via the organizations#show page" do
			within(".navbar") do
				click_link('Organizations')
			end
			within("#organizations-table") do 
				page.first(:link, 'View').click
			end
			within("#locations-table") do 
				page.first(:link, 'Edit').click
			end
			fill_in 'Name', :with => 'NewName'
			click_button('Update Location')
			expect(page).to have_content('Location was successfully updated.')
			expect(page).to have_content 'techhub'
    	expect(page).to have_selector '#organization-details'
   	 	expect(page).to have_selector '#locations-table'
   		within('#locations-table') do 
   			page.should have_content('NewName')
   	  	page.should_not have_content('Old Street')
    	end
		end

		scenario "via the locations#show page" do
			within(".navbar") do
				click_link('Organizations')
			end
			within("#organizations-table") do 
				page.first(:link, 'View').click
			end
			within("#locations-table") do 
				page.first(:link, 'View').click
			end
			click_link 'Edit'
			fill_in 'Name', :with => 'NewName'
			click_button('Update Location')
			expect(page).to have_content('Location was successfully updated.')
			expect(page).to have_content 'techhub'
    	expect(page).to have_selector '#organization-details'
   	 	expect(page).to have_selector '#locations-table'
   		within('#locations-table') do 
   			page.should have_content('NewName')
   	  	page.should_not have_content('Old Street')
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
			within("#locations-table") do 
				page.first(:link, 'Edit').click
			end
			click_link 'Cancel'
			expect(page).to have_content 'techhub'
    	expect(page).to have_selector '#organization-details'
   	 	expect(page).to have_selector '#locations-table'
   		within('#locations-table') do
   	  	page.should have_content('Old Street')
    	end
		end

		scenario "via the locations#show page" do
			within(".navbar") do
				click_link('Organizations')
			end
			within("#organizations-table") do 
				page.first(:link, 'View').click
			end
			within("#locations-table") do 
				page.first(:link, 'View').click
			end
			click_link 'Edit'
			click_link 'Cancel'
			expect(page).to have_content 'techhub'
    	expect(page).to have_selector '#organization-details'
   	 	expect(page).to have_selector '#locations-table'
   		within('#locations-table') do
   	  	page.should have_content('Old Street')
    	end
		end
	end
end
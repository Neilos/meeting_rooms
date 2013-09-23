require 'spec_helper'

feature "creating membership", :js => true do
	
	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create(:name => "techhub")
		log_in_with email: @user.email, password: @password
	end

	context "completing the creation" do
		context "with valid details" do
			scenario "from the user show page" do
				click_link('New Membership')
				fill_in 'organization[name]', :with => @organization.name 
				click_button 'Search'
				within("#search_results") do
					page.should have_selector('tr')
					page.first('.organization_results_row').click
				end
				check('Create organizations')
				check('Create memberships')
				click_button('Create Membership')
				page.should have_content("Membership was successfully created.")
				page.should have_content(@user.name)
				page.should have_content(@user.email)
				expect(page).to have_selector '#memberships-table'
			end
		
			scenario "from the organization show page" do 
				visit_show_page_of_first_organization_in_organizations_table
				click_link 'Memberships'
				click_link('New Membership')
				fill_in 'user[email]', :with => @user.email 
				click_button 'Search'
				within("#search_results") do
					page.first('.user_results_row').click
				end
				check('Create organizations')
				check('Create memberships')
				click_button('Create Membership')
				page.should have_content("Membership was successfully created.")
				page.should have_content(@organization.name)
				click_link 'Memberships'
				expect(page).to have_selector '#memberships-table'
			end
		end

		context "with invalid details" do
			#form cannot be completed with invalid details
		end
	end

	context "cancelling the creation of a membership" do
		scenario "from the user show page" do 
			click_link('New Membership')
			click_link('Cancel')
			page.should have_content(@user.name)
			page.should have_content(@user.email)
			expect(page).to have_selector '#memberships-table'	
		end
	
		scenario "from the organization show page" do 
			visit_show_page_of_first_organization_in_organizations_table
			click_link 'Memberships'
			click_link('New Membership')
			click_link('Cancel')
			page.should have_content(@organization.name)
			click_link 'Memberships'
			expect(page).to have_selector '#memberships-table'
		end
	end
end
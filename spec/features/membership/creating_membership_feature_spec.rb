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
		
			scenario "from the organization show page" do 
				visit organization_path(@organization)
				click_link 'Members'
				click_link('New Member')
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
				click_link 'Members'
				expect(page).to have_selector '#memberships-table'
			end

		end

		#form cannot be completed with invalid details
	end

	context "cancelling the creation of a membership" do

		scenario "from the organization show page" do 
			visit organization_path(@organization)
			click_link 'Members'
			click_link('New Member')
			click_link('Back')
			page.should have_content(@organization.name)
			click_link 'Members'
			expect(page).to have_selector '#memberships-table'
		end

	end

end
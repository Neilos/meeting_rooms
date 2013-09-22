require 'spec_helper'

feature "editing organization" do
	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization1 = Organization.create(:name => "techhub")
		@organization2 = Organization.create(:name => "New Bamboo")
		@permission_set = FactoryGirl.create(:permission_set)
		@membership1 = Membership.create(organization_id: @organization1.id, user_id: @user.id, permission_set_id: @permission_set.id)
		@membership2 = Membership.create(organization_id: @organization2.id, user_id: @user.id, permission_set_id: @permission_set.id)
		log_in_with email: @user.email, password: @password
	end

	context "completing an update" do
		scenario "via the user#show page" do
			page.first(:link, 'Organization Details').click
			within("#organization-details") do
				click_link('Edit')
			end
			fill_in 'Name', :with => 'NewName'
			click_button('Update Organization')
			expect(page).to have_content('Organization was successfully updated.')
			page.should have_content('NewName')
		end

		scenario "via the organizations page" do
			within(".navbar") do
				click_link('Organizations')
			end
			within("#organizations-table") do 
				page.first(:link, 'Edit').click
			end
			fill_in 'Name', :with => 'NewName'
			click_button('Update Organization')
			expect(page).to have_content('Organization was successfully updated.')
			page.should have_content('NewName')
		end
	end

	context "cancelling the update" do
		scenario "via the user#show page" do
			within("#memberships-table") do
				page.first(:link, 'Organization Details').click
			end
			within("#organization-details") do
				click_link('Edit')
			end
			click_link('Cancel')
			page.should have_content('techhub')
			page.should have_content('New Bamboo')
		end

		scenario "via the organizations page" do
			within(".navbar") do
				click_link('Organizations')
			end
			within("#organizations-table") do 
				page.first(:link, 'Edit').click
			end
			click_link('Cancel')
			page.should have_content('techhub')
			page.should have_content('New Bamboo')
		end
	end
end
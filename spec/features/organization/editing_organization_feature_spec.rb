require 'spec_helper'

feature "editing organization" do

	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create(:name => "techhub")
		@permission_set = FactoryGirl.create(:permission_set)
		@membership1 = Membership.create(organization_id: @organization.id, user_id: @user.id, permission_set_id: @permission_set.id)
		log_in_with email: @user.email, password: @password
	end

	scenario "completing an update" do
		visit organization_path(@organization)
		within("#organization-details") do
			click_link('Edit')
		end
		fill_in 'Name', :with => 'NewName'
		click_button('Update Organization')
		expect(page).to have_content('Organization was successfully updated.')
		page.should have_content('NewName')
		page.should_not have_content('techhub')
	end

	scenario "cancelling the update" do
		visit organization_path(@organization)
		within("#organization-details") do
			click_link('Edit')
		end
		click_link('Back')
		page.should have_content(@organization.name)
	end

end
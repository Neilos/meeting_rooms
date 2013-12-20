require 'spec_helper'

feature "deleting organization" do

	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create(:name => "techhub")
		@permission_set = FactoryGirl.create(:permission_set)
		@membership = Membership.create(organization_id: @organization.id, user_id: @user.id, permission_set_id: @permission_set.id)
		log_in_with email: @user.email, password: @password
	end

	scenario "from the organization#show page", js: true do
		visit organization_path(@organization)
		within("#organization-details") do
			click_link('Delete')
		end
		page.driver.browser.switch_to.alert.accept
		expect(page).to have_content('Your Memberships')
		page.should_not have_content('techhub')
	end

end
require 'spec_helper'

feature "deleting organization" do

	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization1 = Organization.create(:name => "techhub")
		@organization2 = Organization.create(:name => "New Bamboo")
		@permission_set = FactoryGirl.create(:permission_set)
		@membership1 = Membership.create(organization_id: @organization1.id, user_id: @user.id, permission_set_id: @permission_set.id)
		@membership2 = Membership.create(organization_id: @organization2.id, user_id: @user.id, permission_set_id: @permission_set.id)
		sign_in_with email: @user.email, password: @password
	end

	scenario "from the organization#show page", js: true do
		page.first(:link, 'Organization Details').click
		within("#organization-details") do
			click_link('Delete')
		end
		page.driver.browser.switch_to.alert.accept
		expect(page).to have_content('Organizations')
		page.should_not have_content('techhub')
	end

end
require 'spec_helper'

feature "deleting membership", js: true do

	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create(:name => "techhub")
		@permission_set = FactoryGirl.create(:permission_set)
		@membership = Membership.create(organization_id: @organization.id, user_id: @user.id, permission_set_id: @permission_set.id)
		log_in_with email: @user.email, password: @password
	end

	scenario "from Organization show page" do
		visit organization_path(@organization)
    click_link 'Members'
		within("#memberships-table") do 
			page.first(:link, 'Delete').click
		end
 		page.driver.browser.switch_to.alert.accept
    expect(page).to have_content @organization.name
  	expect(page).to have_selector '#organization-details'
 	 	click_link 'Members'
 		within('#memberships-table') do
 	  	page.should have_no_content(@membership.user.name)
  	end
	end

end
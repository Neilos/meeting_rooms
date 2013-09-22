require 'spec_helper'

feature "creating organization" do

	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		log_in_with email: @user.email, password: @password 
	end

	scenario "from the user showpage" do
		click_link "New Organization"
		fill_in "Name", :with => "TechHub"
		click_button "Create Organization"
		expect(page).to have_content "Organization was successfully created."
		expect(page).to have_content @user.name
		expect(page).to have_content @user.email
		expect(page).to have_content "TechHub" # should show that the user is a member of the new organization
	end

end
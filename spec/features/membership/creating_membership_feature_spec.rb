require 'spec_helper'

feature "creating membership" do
	
	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create(:name => "techhub")
		sign_in_with email: @user.email, password: @password
	end

	context "completing the creation" do
		context "with valid details" do
			scenario "from the user show page" do
				click_link('New Membership') 
				check('Create organizations')
				check('Create memberships')
			end
		
			scenario "from the organization show page" do 
				pending
			end
		end

		context "with invalid details" do
			scenario "from the user show page" do 
			  pending
			end
		
			scenario "from the organization show page" do 
				pending
			end
		end
	end

	context "cancelling the creation of a membership" do
		scenario "from the user show page" do 
			pending  
		end
	
		scenario "from the organization show page" do 
			pending
		end
	

	end
end
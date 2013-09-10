# require 'spec_helper'

# feature "Authentication protection" do

# 	before :each do
# 		@user = FactoryGirl.create(:user)
# 		@user = FactoryGirl.create(:user)
# 		@user = FactoryGirl.create(:user)
# 		@user = FactoryGirl.create(:user)
# 		@user = FactoryGirl.create(:user)
# 	end

# 	scenario "/ " do
# 		visit "/ "
# 		expect(page).to have_content "Login"
# 		expect(page).to have_content "Sign up"
# 	end

# 	context "user not logged in" do

# 		context "accessing user routes" do

# 			scenario "/users/password" do
# 				visit "/users/password"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/password/new " do
# 				visit "/users/password/new "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/password/edit" do
# 				visit "/users/password/edit"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/password " do
# 				visit "/users/password "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/password " do
# 				visit "/users/password "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/cancel " do
# 				visit "/users/cancel "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users" do
# 				visit "/users"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/sign_up" do
# 				visit "/users/sign_up"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/edit " do
# 				visit "/users/edit "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users" do
# 				visit "/users"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users" do
# 				visit "/users"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users" do
# 				visit "/users"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/new_with_omniauth" do
# 				visit "/users/new_with_omniauth"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/:user_id/memberships " do
# 				visit "/users/:user_id/memberships "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/:user_id/memberships " do
# 				visit "/users/:user_id/memberships "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/:user_id/memberships/new " do
# 				visit "/users/:user_id/memberships/new "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/:user_id/memberships/:id/edit" do
# 				visit "/users/:user_id/memberships/:id/edit"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/:user_id/memberships/:id " do
# 				visit "/users/:user_id/memberships/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/:user_id/memberships/:id " do
# 				visit "/users/:user_id/memberships/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/:user_id/memberships/:id " do
# 				visit "/users/:user_id/memberships/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/:user_id/memberships/:id " do
# 				visit "/users/:user_id/memberships/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users" do
# 				visit "/users"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/users/:id" do
# 				visit "/users/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 		end


# 		context "accessing organizations routes" do

# 			scenario "/organizations/:organization_id/memberships " do
# 				visit "/organizations/:organization_id/memberships "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/memberships " do
# 				visit "/organizations/:organization_id/memberships "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/memberships/new " do
# 				visit "/organizations/:organization_id/memberships/new "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/memberships/:id/edit" do
# 				visit "/organizations/:organization_id/memberships/:id/edit"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/memberships/:id " do
# 				visit "/organizations/:organization_id/memberships/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/memberships/:id " do
# 				visit "/organizations/:organization_id/memberships/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/memberships/:id " do
# 				visit "/organizations/:organization_id/memberships/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/memberships/:id " do
# 				visit "/organizations/:organization_id/memberships/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/rooms " do
# 				visit "/organizations/:organization_id/rooms "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/rooms " do
# 				visit "/organizations/:organization_id/rooms "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/rooms/new " do
# 				visit "/organizations/:organization_id/rooms/new "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/rooms/:id/edit" do
# 				visit "/organizations/:organization_id/rooms/:id/edit"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/rooms/:id " do
# 				visit "/organizations/:organization_id/rooms/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/rooms/:id " do
# 				visit "/organizations/:organization_id/rooms/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/rooms/:id " do
# 				visit "/organizations/:organization_id/rooms/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/rooms/:id " do
# 				visit "/organizations/:organization_id/rooms/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/locations " do
# 				visit "/organizations/:organization_id/locations "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/locations " do
# 				visit "/organizations/:organization_id/locations "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/locations/new " do
# 				visit "/organizations/:organization_id/locations/new "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/locations/:id/edit" do
# 				visit "/organizations/:organization_id/locations/:id/edit"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/locations/:id " do
# 				visit "/organizations/:organization_id/locations/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/locations/:id " do
# 				visit "/organizations/:organization_id/locations/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/locations/:id " do
# 				visit "/organizations/:organization_id/locations/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:organization_id/locations/:id " do
# 				visit "/organizations/:organization_id/locations/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations" do
# 				visit "/organizations"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations" do
# 				visit "/organizations"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/new" do
# 				visit "/organizations/new"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:id/edit " do
# 				visit "/organizations/:id/edit "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:id" do
# 				visit "/organizations/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:id" do
# 				visit "/organizations/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:id" do
# 				visit "/organizations/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/organizations/:id" do
# 				visit "/organizations/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 		end


# 		context "accessing location routes" do

# 			scenario "/locations/:location_id/rooms " do
# 				visit "/locations/:location_id/rooms "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/locations/:location_id/rooms " do
# 				visit "/locations/:location_id/rooms "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/locations/:location_id/rooms/new " do
# 				visit "/locations/:location_id/rooms/new "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/locations/:location_id/rooms/:id/edit" do
# 				visit "/locations/:location_id/rooms/:id/edit"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/locations/:location_id/rooms/:id " do
# 				visit "/locations/:location_id/rooms/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/locations/:location_id/rooms/:id " do
# 				visit "/locations/:location_id/rooms/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/locations/:location_id/rooms/:id " do
# 				visit "/locations/:location_id/rooms/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/locations/:location_id/rooms/:id " do
# 				visit "/locations/:location_id/rooms/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/locations" do
# 				visit "/locations"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/locations" do
# 				visit "/locations"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/locations/new" do
# 				visit "/locations/new"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/locations/:id/edit " do
# 				visit "/locations/:id/edit "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/locations/:id" do
# 				visit "/locations/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/locations/:id" do
# 				visit "/locations/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/locations/:id" do
# 				visit "/locations/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/locations/:id" do
# 				visit "/locations/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 		end


# 		context "accessing room routes" do

# 			scenario "/rooms/:room_id/custom_attributes " do
# 				visit "/rooms/:room_id/custom_attributes "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/rooms/:room_id/custom_attributes " do
# 				visit "/rooms/:room_id/custom_attributes "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/rooms/:room_id/custom_attributes/new " do
# 				visit "/rooms/:room_id/custom_attributes/new "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/rooms/:room_id/custom_attributes/:id/edit" do
# 				visit "/rooms/:room_id/custom_attributes/:id/edit"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/rooms/:room_id/custom_attributes/:id " do
# 				visit "/rooms/:room_id/custom_attributes/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/rooms/:room_id/custom_attributes/:id " do
# 				visit "/rooms/:room_id/custom_attributes/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/rooms/:room_id/custom_attributes/:id " do
# 				visit "/rooms/:room_id/custom_attributes/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/rooms/:room_id/custom_attributes/:id " do
# 				visit "/rooms/:room_id/custom_attributes/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/rooms" do
# 				visit "/rooms"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/rooms" do
# 				visit "/rooms"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/rooms/new" do
# 				visit "/rooms/new"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/rooms/:id/edit " do
# 				visit "/rooms/:id/edit "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/rooms/:id" do
# 				visit "/rooms/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/rooms/:id" do
# 				visit "/rooms/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/rooms/:id" do
# 				visit "/rooms/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/rooms/:id" do
# 				visit "/rooms/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 		end


# 		context "accessing custom_attributes routes" do

# 			scenario "/custom_attributes" do
# 				visit "/custom_attributes"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/custom_attributes" do
# 				visit "/custom_attributes"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/custom_attributes/new" do
# 				visit "/custom_attributes/new"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/custom_attributes/:id/edit " do
# 				visit "/custom_attributes/:id/edit "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/custom_attributes/:id" do
# 				visit "/custom_attributes/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/custom_attributes/:id" do
# 				visit "/custom_attributes/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/custom_attributes/:id" do
# 				visit "/custom_attributes/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/custom_attributes/:id" do
# 				visit "/custom_attributes/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 		end


# 		context "accessing memberships routes" do

# 			scenario "/memberships" do
# 				visit "/memberships"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/memberships" do
# 				visit "/memberships"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/memberships/new" do
# 				visit "/memberships/new"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/memberships/:id/edit " do
# 				visit "/memberships/:id/edit "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/memberships/:id" do
# 				visit "/memberships/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/memberships/:id" do
# 				visit "/memberships/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/memberships/:id" do
# 				visit "/memberships/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/memberships/:id" do
# 				visit "/memberships/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 		end


# 		context "accessing permission_sets routes" do

# 			scenario "/permission_sets" do
# 				visit "/permission_sets"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/permission_sets" do
# 				visit "/permission_sets"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/permission_sets/new" do
# 				visit "/permission_sets/new"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/permission_sets/:id/edit " do
# 				visit "/permission_sets/:id/edit "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/permission_sets/:id" do
# 				visit "/permission_sets/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/permission_sets/:id" do
# 				visit "/permission_sets/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/permission_sets/:id" do
# 				visit "/permission_sets/:id"
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 			scenario "/permission_sets/:id " do
# 				visit "/permission_sets/:id "
# 				expect(page).to have_content "You need to sign in or sign up before continuing."
# 			end

# 		end
	
# 	end

# end

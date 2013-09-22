require 'spec_helper'

feature "viewing membership permission set" do

	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create(:name => "techhub")
		@permission_set = FactoryGirl.create(:permission_set)
		@membership = Membership.create(organization_id: @organization.id, user_id: @user.id, permission_set_id: @permission_set.id)
		log_in_with email: @user.email, password: @password
	end

	scenario "from organization show page" do
		visit_show_page_of_first_organization_in_organizations_table
		within("#memberships-table") do 
			page.first(:link, 'View').click
		end
		expect(page).to have_content "Membership"
    expect(page).to have_content @user.name
    expect(page).to have_content @organization.name
    @permission_set.attributes.each do |ability, allowed| 
    	if %w[created_at updated_at id].include? ability
    		expect(page).to have_no_content ActiveRecord::Base.human_attribute_name(ability)
    	else
    		expect(page).to have_content ActiveRecord::Base.human_attribute_name(ability)
    	end
    end
    click_link('Back')
    expect(page).to have_content @organization.name
    expect(page).to have_selector '#organization-details'
 	 	expect(page).to have_selector '#locations-table'
    expect(page).to have_selector '#memberships-table'
	end

	scenario "from the user show page" do 
		within("#memberships-table") do 
			page.first(:link, 'View').click
		end
		expect(page).to have_content "Membership"
    expect(page).to have_content @user.name
    expect(page).to have_content @organization.name
    @permission_set.attributes.each do |ability, allowed| 
    	if %w[created_at updated_at id].include? ability
    		expect(page).to have_no_content ActiveRecord::Base.human_attribute_name(ability)
    	else
    		expect(page).to have_content ActiveRecord::Base.human_attribute_name(ability)
    	end
  	end
    click_link('Back')
    expect(page).to have_content @user.email
    expect(page).to have_content @user.name
    expect(page).to have_selector '#memberships-table'
	end
end
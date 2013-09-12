require 'spec_helper'

feature "deleting location" do
		before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create(:name => "techhub")
		@location1 = FactoryGirl.create(:location, organization_id: @organization.id, name: "Old Street")
		@location2 = FactoryGirl.create(:location2, organization_id: @organization.id, name: "White City")
		sign_in_with email: @user.email, password: @password
	end

	scenario "from the organization#show page", js: true do
		within(".navbar") do
			click_link('Organizations')
		end
		within("#organizations-table") do
			page.first(:link, 'View').click
		end
		within("#locations-table") do
			page.first(:link, 'Delete').click
		end
		page.driver.browser.switch_to.alert.accept
		expect(page).to have_content 'Location was successfully deleted.'
    expect(page).to have_content 'techhub'
    expect(page).to have_selector '#organization-details'
    expect(page).to have_selector '#locations-table'
    within('#locations-table') do 
      page.should_not have_content('Old Street')
    end
		page.should_not have_content('Old Street')
	end

	scenario "from the location show page", js: true do 
		within(".navbar") do
			click_link('Organizations')
		end
		within("#organizations-table") do
			page.first(:link, 'View').click
		end
		within("#locations-table") do
			page.first(:link, 'View').click
		end
		click_link('Delete')
		page.driver.browser.switch_to.alert.accept
		expect(page).to have_content 'Location was successfully deleted.'
    expect(page).to have_content 'techhub'
    expect(page).to have_selector '#organization-details'
    expect(page).to have_selector '#locations-table'
    within('#locations-table') do 
      page.should_not have_content('Old Street')
    end
		page.should_not have_content('Old Street')
	end

end
require 'spec_helper'

feature "creating location" do

  before :each do 
    @password = "password"
    @user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
    @organization = Organization.create(:name => "techhub")
    log_in_with email: @user.email, password: @password
    visit organization_path(@organization)
  end

  context "completing the creation of a location" do

    context "with valid details" do

    	scenario "from the organizations#show page" do
        click_link 'Locations'
        click_link 'New Location'
        fill_in 'Name', :with => 'Head Office'
        fill_in 'Address line 1', :with => '17 example street'
        fill_in 'Address line 2', :with => 'example area'
        fill_in 'Town city', :with => 'example city'
        fill_in 'County', :with => 'example county'
        fill_in 'Postcode', :with => 'EXA MPLE'
        fill_in 'Country', :with => 'United Kingdom'
        click_button 'Create Location'
        expect(page).to have_content 'Location was successfully created.'
        expect(page).to have_content 'techhub'
        expect(page).to have_selector '#organization-details'
        click_link 'Locations'
        expect(page).to have_selector '#locations-table'
        within('#locations-table') do 
          expect(page).to have_content 'Head Office'
          expect(page).to have_content '17 example street'
        end
      end

    end

    context "with INvalid/missing details" do

      scenario "from the organizations#show page" do
        click_link 'Locations'
        click_link 'New Location'
        click_button 'Create Location'
        expect(page).to have_content 'errors prohibited this location from being saved:'
        expect(page).to have_content 'New Location'
      end

    end

  end

  context "cancelling the creation of a location" do

    scenario "from the organizations#show page" do
      click_link 'Locations'
      click_link 'New Location'
      fill_in 'Name', :with => 'Head Office'
      fill_in 'Address line 1', :with => '17 example street'
      fill_in 'Address line 2', :with => 'example area'
      fill_in 'Town city', :with => 'example city'
      fill_in 'County', :with => 'example county'
      fill_in 'Postcode', :with => 'EXA MPLE'
      fill_in 'Country', :with => 'United Kingdom'
      click_link('Back')
      expect(page).to have_content 'techhub'
      expect(page).to have_selector '#organization-details'
      click_link 'Locations'
      expect(page).to have_selector '#locations-table'
      within('#locations-table') do 
        page.should_not have_content 'Head Office'
        page.should_not have_content '17 example street'
      end
    end

  end

end
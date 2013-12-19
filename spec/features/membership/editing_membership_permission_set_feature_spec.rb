require 'spec_helper'

feature "editing membership permission set", :js => true do

	before :each do 
		@password = "password"
		@user = FactoryGirl.create(:user, email: "user1@email.com", password: @password, password_confirmation: @password)
		@organization = Organization.create!(:name => "techhub")
    @permission_set = PermissionSet.get_admin_permission_set
    @permission_set.save
    @membership = Membership.create!(:organization_id => @organization.id, :user_id => @user.id, :permission_set_id => @permission_set.id)
		log_in_with email: @user.email, password: @password
	end

	context "completing the update" do
		context "with valid details" do
			scenario "via the user show page" do
				within("#memberships-table") do 
          page.first(:link, 'Edit').click
        end
				uncheck('Create organizations')
				click_button('Update Membership')
				page.should have_content("Membership was successfully updated.")
				page.should have_content(@user.name)
				page.should have_content(@user.email)
				expect(page).to have_selector '#memberships-table'
        @membership.reload
        @membership.permission_set[:create__organizations].should eq false
			end
		
			scenario "via the organization show page" do 
				visit_show_page_of_first_organization_in_organizations_table
        click_link "Members"
				within("#memberships-table") do 
          page.first(:link, 'Edit').click
        end
        uncheck('Create memberships')
        click_button('Update Membership')
        page.should have_content("Membership was successfully updated.")
				page.should have_content(@organization.name)
        @membership.reload
        @membership.permission_set[:create__memberships].should eq false
			end
      
      scenario "from the membership show page" do
        visit_show_page_of_first_organization_in_organizations_table
        click_link "Members"
        within("#memberships-table") do 
          page.first(:link, 'View').click
        end
        click_link 'Edit'
        uncheck('Create organizations')
        click_button('Update Membership')
        page.should have_content("Membership was successfully updated.")
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
        @membership.reload
        @membership.permission_set[:create__organizations].should eq false
      end
		end

		context "with invalid details" do
			#form cannot be completed with invalid details
		end
	end

	context "cancelling the creation of a membership" do
		scenario "from the user show page" do 
			within("#memberships-table") do 
        page.first(:link, 'Edit').click
      end
			click_link('Cancel')
			page.should have_content(@user.name)
			page.should have_content(@user.email)
			expect(page).to have_selector '#memberships-table'	
		end
	
		scenario "from the organization show page" do 
			visit_show_page_of_first_organization_in_organizations_table
      click_link "Members"
			within("#memberships-table") do 
        page.first(:link, 'Edit').click
      end
			click_link('Cancel')
			page.should have_content(@organization.name)
		end

    context "from the membership show page" do
      scenario "via the organization show page" do
        visit_show_page_of_first_organization_in_organizations_table
        click_link "Members"
        within("#memberships-table") do 
          page.first(:link, 'View').click
        end
        click_link 'Edit'
        click_link('Cancel')
        page.should have_content(@organization.name)
      end

      scenario "via the user show page" do
        within("#memberships-table") do 
          page.first(:link, 'View').click
        end
        click_link 'Edit'
        click_link('Cancel')
        page.should have_content(@user.name)
        page.should have_content(@user.email)
        expect(page).to have_selector '#memberships-table'  
      end
    end
	end
end
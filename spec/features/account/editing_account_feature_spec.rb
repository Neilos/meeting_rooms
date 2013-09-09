require 'spec_helper'

feature "Editing account" do
  before(:each) do
    @user = User.create!( :name => 'Mike Mike', 
                  :email => 'user34@example.com', 
                  :password => 'password',
                  :password_confirmation => 'password')
    visit '/'
    click_link 'Login'
    fill_in 'Email', :with => 'user34@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
  end

  context "with current password provided" do
    scenario "when changing the email address" do
      click_link 'Edit account'
      fill_in 'Email', :with => 'user34@example.com'
      fill_in 'Current password', :with => 'password'
      click_button 'Update'
      expect(page).to have_content 'You updated your account successfully'
    end
  end

  context "no current password is entered" do
    scenario "when changing the email address" do
      click_link 'Edit account'
      fill_in 'Email', :with => 'user36@example.com'
      click_button 'Update'
      expect(page).to have_content '1 error prohibited this user from being saved:'
      expect(page).to have_content "Current password can't be blank"
    end

    scenario "when changing password" do
      click_link 'Edit account'
      fill_in 'Password', :with => 'newpassword'
      fill_in 'Password confirmation', :with => 'newpassword'
      click_button 'Update'
      expect(page).to have_content 'You updated your account successfully.'
      click_link 'Logout'
      click_link 'Login'
      fill_in 'Email', :with => 'user34@example.com'
      fill_in 'Password', :with => 'newpassword'
      click_button 'Sign in'
      expect(page).to have_content 'Signed in successfully'
    end

    scenario "when changing account fields other than password and email" do
      click_link 'Edit account'
      fill_in 'Name', :with => 'New Name'
      click_button 'Update'
      expect(page).to have_content 'You updated your account successfully.'
      @user.reload
      @user.name.should == 'New Name'
    end
  end
end


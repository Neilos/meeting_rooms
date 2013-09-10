require 'spec_helper'

feature "Logging Out" do
  before(:each) do
    User.create!( :name => 'Mike Mike', 
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

  scenario "when a user is signed in" do
    click_link 'Logout'
    expect(page).to have_content 'Signed out successfully'
  end
end
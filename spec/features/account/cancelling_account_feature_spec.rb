require 'spec_helper'

feature "Account cancellation" do
  scenario "cancelling account", :js => true do
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
    click_link 'Edit account'
    click_button 'Cancel my account'
    alert = page.driver.browser.switch_to.alert
    alert.text.should eq("Are you sure?")
    alert.accept
    expect(page).to have_content 'Bye! Your account was successfully cancelled. We hope to see you again soon.'
  end
end
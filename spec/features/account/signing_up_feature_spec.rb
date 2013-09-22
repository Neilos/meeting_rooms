require 'spec_helper'

feature "Signing up" do

  before :all do
    NewUser = Struct.new(:name, :email, :password, :password_confirmation)
  end

  context "by entering email address and password on the sign up page" do
    scenario "with valid details" do
      visit '/'
      click_link 'Sign up'
      fill_in 'Name', :with => 'John Smith'
      fill_in 'Email', :with => 'user34@example.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Password confirmation', :with => 'password'
      click_button 'Sign up'
      expect(page).to have_content 'Welcome! You have signed up successfully'
    end

    scenario "invalid details are provided" do
      visit '/'
      click_link 'Sign up'
      fill_in 'Name', :with => 'John Smith'
      fill_in 'Email', :with => 'invalid@h'
      fill_in 'Password', :with => 'password'
      fill_in 'Password confirmation', :with => 'password'
      click_button 'Sign up'
      expect(page).to have_content '1 error prohibited this user from being saved:'
      expect(page).to have_content 'Email is invalid'
    end

    scenario "Where email address is already registered to another user" do
      User.create!( :name => 'Mike Mike', 
                  :email => 'user34@example.com', 
                  :password => 'password',
                  :password_confirmation => 'password')
      visit '/'
      click_link 'Sign up'
      fill_in 'Name', :with => 'John Smith'
      fill_in 'Email', :with => 'user34@example.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Password confirmation', :with => 'password'
      click_button 'Sign up'
      expect(page).to have_content '1 error prohibited this user from being saved:'
      expect(page).to have_content 'Email has already been taken'
    end
  end

  
  context "via social network OAuth provider" do

    scenario "with valid credentials" do
      user = NewUser.new("neil", 'neil@example.com', 'password', 'password')
      expect(User.count).to eq 0
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = google_response_for user, "123456"
      visit '/'
      click_link 'Sign up'
      click_link 'Sign in with Google Oauth2'
      expect(page).to have_content 'Your account has been created via Google. In your profile you can change your personal information and amend your local password from the one we have randomly generated for you.'
      expect(User.count).to eq 1
    end

    scenario "with INvalid credentials" do
      expect(User.count).to eq 0
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
      visit '/'
      click_link 'Sign up'
      click_link 'Sign in with Facebook'
      expect(page).to have_content 'Could not authenticate you from Facebook because'
      expect(User.count).to eq 0
    end

    scenario "where email address returned by omniauth provider is blank" do
      expect(User.count).to eq 0
      OmniAuth.config.test_mode = true
      user = NewUser.new("neil", '', 'password', 'password')
      OmniAuth.config.mock_auth[:facebook] = facebook_response_for user, '10101010'
      visit '/'
      click_link 'Sign up'
      click_link 'Sign in with Facebook'
      expect(page).to have_content 'Facebook can not be used to sign-in as they have not provided us with your email address. Please use another authentication provider or use local sign-up.'
      expect(User.count).to eq 0
    end

    context "where insufficient signup details returned by OAuth provider" do
      context "missing details manually entered by user" do

        scenario "password entered" do
          user = NewUser.new("neil", 'password', 'password')
          expect(User.count).to eq 0
          OmniAuth.config.test_mode = true
          # twiter service does not currently contain an email address in the omniauth hash
          OmniAuth.config.mock_auth[:twitter] = twitter_response_for user, '10101010'
          visit '/'
          click_link 'Sign up'
          click_link 'Sign in with Twitter'
          expect(page).to have_content "Email can't be blank"
          fill_in 'Email', :with => 'jon@example.com'
          fill_in 'Password', :with => 'password'
          click_button 'Complete sign in'
          expect(page).to have_content 'Your account has been created via Twitter. In your profile you can change your personal information and amend your local password from the one we have randomly generated for you.'
          expect(User.count).to eq 1
          click_link 'Log out'
          click_link 'Log in'
          fill_in 'Email', :with => 'jon@example.com'
          fill_in 'Password', :with => 'password'
          click_button 'Log in'
          expect(page).to have_content 'Signed in successfully'
        end

        scenario "NO password entered" do
          user = NewUser.new("neil", 'password', 'password')
          expect(User.count).to eq 0
          OmniAuth.config.test_mode = true
          # twiter service does not currently contain an email address in the omniauth hash
          OmniAuth.config.mock_auth[:twitter] = twitter_response_for user, '10101010'
          visit '/'
          click_link 'Sign up'
          click_link 'Sign in with Twitter'
          expect(page).to have_content "Email can't be blank"
          fill_in 'Email', :with => 'jon@example.com'
          click_button 'Complete sign in'
          expect(page).to have_content "Password can't be blank"
          expect(User.count).to eq 0
        end
      end
    end
  end
end
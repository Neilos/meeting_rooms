require 'spec_helper'

feature "Logging in" do
  before(:each) do
    @mike = User.create!( :name => 'Mike Mike',  
                  :email => 'user34@example.com', 
                  :password => 'password',
                  :password_confirmation => 'password')
    @ted = User.create!( :name => 'Ted Ted',  
                  :email => 'user50@example.com',
                  :password => 'password',
                  :password_confirmation => 'password')
    @ted_facebook_omniauth_identity = @ted.omniauth_identities.create(:provider => 'facebook', :uid => '654321')
    @neil = User.create!( :name => 'Neil Neil',  
                  :email => 'user40@example.com',
                  :password => 'password',
                  :password_confirmation => 'password')
    @neil_google_omniauth_identity = @neil.omniauth_identities.create(:provider => 'google_oauth2', :uid => '123456')
    visit '/'
    click_link 'Login'
  end


  context "with email and password entered on login page" do
    scenario "with correct credentials" do
      fill_in 'Email', :with => 'user34@example.com'
      fill_in 'Password', :with => 'password'
      click_button 'Sign in'
      expect(page).to have_content 'Signed in successfully'
    end

    scenario "with an unrecognized password" do
      fill_in 'Email', :with => 'user34@example.com'
      fill_in 'Password', :with => 'unrecognized'
      click_button'Sign in'
      expect(page).to have_content 'Invalid email or password'
    end

    scenario "as an unrecognized user" do
      fill_in 'Email', :with => 'somebody@anywhere.com'
      fill_in 'Password', :with => 'password'
      click_button 'Sign in'
      expect(page).to have_content 'Invalid email or password'
    end

    scenario "when password forgotten" do
      click_link 'Forgot your password?'
      fill_in 'Email', :with => 'user34@example.com'
      click_button 'Send me reset password instructions'
      expect(page).to have_content 'You will receive an email with instructions about how to reset your password in a few minutes.'
      email = ActionMailer::Base.deliveries.last
      email.to.should == ['user34@example.com']
      email.body.should have_content 'Someone has requested a link to change your password.'
    end
  end


  context "via social media" do

    scenario "with INvalid login credentials" do
      expect(User.count).to eq 3
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
      visit '/'
      click_link 'Sign up'
      click_link 'Sign in with Facebook'
      expect(page).to have_content 'Could not authenticate you from Facebook because'
      expect(User.count).to eq 3
    end


    context "having signed up with email and password" do 
      scenario "with valid login credentials" do
        expect(User.count).to eq 3
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:facebook] = facebook_response_for @mike, "1234568"
        visit '/'
        click_link 'Sign up'
        click_link 'Sign in with Facebook'
        expect(page).to have_content 'Sign in via Facebook has been added to your account. Signed in successfully!'
        expect(User.count).to eq 3
      end
    end


    context "having signed up with social media" do 
      scenario "with valid login credentials" do
        expect(User.count).to eq 3
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google_oauth2] = google_response_for @neil, @neil_google_omniauth_identity[:uid]
        visit '/'
        click_link 'Sign up'
        click_link 'Sign in with Google Oauth2'
        expect(page).to have_content 'Signed in successfully via Google.'
        expect(User.count).to eq 3
      end


      context "having changed the email registered with social media provider since signing up" do
        scenario "logging in with social media" do
          expect(User.count).to eq 3
          OmniAuth.config.test_mode = true
          OmniAuth.config.mock_auth[:facebook] = facebook_response_for @ted, @ted_facebook_omniauth_identity[:uid], 'DIFFERENT@example.com'
          visit '/'
          click_link 'Sign up'
          click_link 'Sign in with Facebook'
          expect(page).to have_content 'Signed in successfully via Facebook.'
          expect(User.count).to eq 3
        end
      end


      context "and logging in with a different social media provider" do 
        scenario "where email address is returned by social media provider" do
          expect(User.count).to eq 3
          OmniAuth.config.test_mode = true
          OmniAuth.config.mock_auth[:google_oauth2] = google_response_for @ted, "5648392"
          visit '/'
          click_link 'Sign up'
          click_link 'Sign in with Google Oauth2'
          expect(page).to have_content 'Sign in via Google has been added to your account. Signed in successfully!'
          expect(User.count).to eq 3
        end

        scenario "where NO email address is returned by social media provider" do
          expect(User.count).to eq 3
          OmniAuth.config.test_mode = true
          OmniAuth.config.mock_auth[:facebook] = facebook_response_for @neil, '10101010', ''
          visit '/'
          click_link 'Sign up'
          click_link 'Sign in with Facebook'
          expect(page).to have_content 'Facebook can not be used to sign-in as they have not provided us with your email address. Please use another authentication provider or use local sign-up.'
          expect(User.count).to eq 3
        end

        # twiter does not currently contain an email address in the omniauth hash
        context "where no email is returned by social media provider" do
          context "email manually entered by user" do
            scenario "password not manually entered" do
              expect(User.count).to eq 3
              OmniAuth.config.test_mode = true
              OmniAuth.config.mock_auth[:twitter] = twitter_response_for @mike, '123456gf'
              visit '/'
              click_link 'Sign up'
              click_link 'Sign in with Twitter'
              expect(page).to have_content "Email can't be blank"
              fill_in 'Email', :with => @mike.email
              fill_in 'Password', :with => @mike.password
              click_button 'Complete sign in'
              expect(page).to have_content 'Sign in via Twitter has been added to your account. Signed in successfully!'
              expect(User.count).to eq 3
            end

            scenario "NO password manually entered" do
              expect(User.count).to eq 3
              OmniAuth.config.test_mode = true
              OmniAuth.config.mock_auth[:twitter] = twitter_response_for @mike, '123456gf'
              visit '/'
              click_link 'Sign up'
              click_link 'Sign in with Twitter'
              expect(page).to have_content "Email can't be blank"
              fill_in 'Email', :with => @mike.email
              click_button 'Complete sign in'
              expect(page).to have_content "Password incorrect!"
              expect(User.count).to eq 3
            end
          end
        end
      end
    end
  end
end
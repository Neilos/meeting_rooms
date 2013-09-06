require 'spec_helper'

feature "Signing up" do

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
      expect(User.count).to eq 0
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
          :provider => "google_oauth2",
          :uid => "123456",
          :info => {
              :name => "Neil Neil",
              :email => "user40@example.com",
              :first_name => "Neil",
              :last_name => "Neil",
              :image => "https://lh3.googleusercontent.com/url/photo.jpg"
          },
          :credentials => {
              :token => "token",
              :refresh_token => "another_token",
              :expires_at => 1354920555,
              :expires => true
          },
          :extra => {
              :raw_info => {
                  :id => "123456",
                  :email => "user40@example.com",
                  :verified_email => true,
                  :name => "Neil Neil",
                  :given_name => "Neil",
                  :family_name => "Neil",
                  :link => "https://plus.google.com/123456789",
                  :picture => "https://lh3.googleusercontent.com/url/photo.jpg",
                  :gender => "male",
                  :birthday => "0000-06-25",
                  :locale => "en",
                  :hd => "company_name.com"
              }
          }
      })
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
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
          :provider => 'facebook',
          :uid => '10101010',
          :info => {
            :nickname => 'NNeil',
            :email => '',
            :name => 'Neil Neil',
            :first_name => 'Neil',
            :last_name => 'Neil',
            :image => 'http://graph.facebook.com/1234567/picture?type=square',
            :urls => { :Facebook => 'http://www.facebook.com/jbloggs' },
            :location => 'Palo Alto, California',
            :verified => true
          },
          :credentials => {
            :token => 'ABCDEF', # OAuth 2.0 access_token, which you may wish to store
            :expires_at => 1321747205, # when the access token expires (it always will)
            :expires => true # this will always be true
          },
          :extra => {
            :raw_info => {
              :id => '10101010',
              :name => 'Neil Neil',
              :first_name => 'Neil',
              :last_name => 'Neil',
              :link => 'http://www.facebook.com/jbloggs',
              :username => 'NNeil',
              :location => { :id => '123456789', :name => 'Palo Alto, California' },
              :gender => 'male',
              :email => '',
              :timezone => -8,
              :locale => 'en_US',
              :verified => true,
              :updated_time => '2011-11-11T06:21:03+0000'
            }
          }
      })
      visit '/'
      click_link 'Sign up'
      click_link 'Sign in with Facebook'
      expect(page).to have_content 'Facebook can not be used to sign-in as they have not provided us with your email address. Please use another authentication provider or use local sign-up.'
      expect(User.count).to eq 0
    end

    context "where insufficient signup details returned by OAuth provider" do
      context "missing details manually entered by user" do
        scenario "password entered" do
          expect(User.count).to eq 0
          OmniAuth.config.test_mode = true
          OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
            :provider => "twitter",
            :uid => "123456",
            :info => {
              :nickname => "johnqpublic",
              :name => "John Q Public",
              :location => "Anytown, USA",
              :image => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
              :description => "a very normal guy.",
              :urls => {
                :Website => nil,
                :Twitter => "https://twitter.com/johnqpublic"
              }
            },
            :credentials => {
              :token => "a1b2c3d4...",
              :secret => "abcdef1234"
            },
            :extra => {
              :access_token => "",
              :raw_info => {
                :name => "John Q Public",
                :listed_count => 0,
                :profile_sidebar_border_color => "181A1E",
                :url => nil,
                :lang => "en",
                :statuses_count => 129,
                :profile_image_url => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
                :profile_background_image_url_https => "https://twimg0-a.akamaihd.net/profile_background_images/229171796/pattern_036.gif",
                :location => "Anytown, USA",
                :time_zone => "Chicago",
                :follow_request_sent => false,
                :id => 123456,
                :profile_background_tile => true,
                :profile_sidebar_fill_color => "666666",
                :followers_count => 1,
                :default_profile_image => false,
                :screen_name => "",
                :following => false,
                :utc_offset => -3600,
                :verified => false,
                :favourites_count => 0,
                :profile_background_color => "1A1B1F",
                :is_translator => false,
                :friends_count => 1,
                :notifications => false,
                :geo_enabled => true,
                :profile_background_image_url => "http://twimg0-a.akamaihd.net/profile_background_images/229171796/pattern_036.gif",
                :protected => false,
                :description => "a very normal guy.",
                :profile_link_color => "2FC2EF",
                :created_at => "Thu Jul 4 00:00:00 +0000 2013",
                :id_str => "123456",
                :profile_image_url_https => "https://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
                :default_profile => false,
                :profile_use_background_image => false,
                :entities => {
                  :description => {
                    :urls => []
                  }
                },
                :profile_text_color => "666666",
                :contributors_enabled => false
              }
            }
          })
          visit '/'
          click_link 'Sign up'
          click_link 'Sign in with Twitter'
          expect(page).to have_content "Email can't be blank"
          fill_in 'Email', :with => 'jon@example.com'
          fill_in 'Password', :with => 'password'
          click_button 'Complete sign in'
          expect(page).to have_content 'Your account has been created via Twitter. In your profile you can change your personal information and amend your local password from the one we have randomly generated for you.'
          expect(User.count).to eq 1
          click_link 'Logout'
          click_link 'Login'
          fill_in 'Email', :with => 'jon@example.com'
          fill_in 'Password', :with => 'password'
          click_button 'Sign in'
          expect(page).to have_content 'Signed in successfully'
        end

        scenario "NO password entered" do
          expect(User.count).to eq 0
          OmniAuth.config.test_mode = true
          OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
            :provider => "twitter",
            :uid => "123456",
            :info => {
              :nickname => "johnqpublic",
              :name => "John Q Public",
              :location => "Anytown, USA",
              :image => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
              :description => "a very normal guy.",
              :urls => {
                :Website => nil,
                :Twitter => "https://twitter.com/johnqpublic"
              }
            },
            :credentials => {
              :token => "a1b2c3d4...",
              :secret => "abcdef1234"
            },
            :extra => {
              :access_token => "",
              :raw_info => {
                :name => "John Q Public",
                :listed_count => 0,
                :profile_sidebar_border_color => "181A1E",
                :url => nil,
                :lang => "en",
                :statuses_count => 129,
                :profile_image_url => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
                :profile_background_image_url_https => "https://twimg0-a.akamaihd.net/profile_background_images/229171796/pattern_036.gif",
                :location => "Anytown, USA",
                :time_zone => "Chicago",
                :follow_request_sent => false,
                :id => 123456,
                :profile_background_tile => true,
                :profile_sidebar_fill_color => "666666",
                :followers_count => 1,
                :default_profile_image => false,
                :screen_name => "",
                :following => false,
                :utc_offset => -3600,
                :verified => false,
                :favourites_count => 0,
                :profile_background_color => "1A1B1F",
                :is_translator => false,
                :friends_count => 1,
                :notifications => false,
                :geo_enabled => true,
                :profile_background_image_url => "http://twimg0-a.akamaihd.net/profile_background_images/229171796/pattern_036.gif",
                :protected => false,
                :description => "a very normal guy.",
                :profile_link_color => "2FC2EF",
                :created_at => "Thu Jul 4 00:00:00 +0000 2013",
                :id_str => "123456",
                :profile_image_url_https => "https://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
                :default_profile => false,
                :profile_use_background_image => false,
                :entities => {
                  :description => {
                    :urls => []
                  }
                },
                :profile_text_color => "666666",
                :contributors_enabled => false
              }
            }
          })
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
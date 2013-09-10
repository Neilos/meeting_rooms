module OmniauthHelpers

  def facebook_response_for(user, uid, email=user.email)
    OmniAuth::AuthHash.new({
      :provider => 'facebook',
      :uid => uid,
      :info => {
        :nickname => user.name,
        :email => email,
        :name => user.name,
        :first_name => user.name.split(' ').first,
        :last_name => user.name.split(' ').last,
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
          :id => uid,
          :name => user.name,
          :first_name => user.name.split(' ').first,
          :last_name => user.name.split(' ').last,
          :link => 'http://www.facebook.com/jbloggs',
          :username => 'MMike',
          :location => { :id => '123456789', :name => 'Palo Alto, California' },
          :gender => 'male',
          :email => email,
          :timezone => -8,
          :locale => 'en_US',
          :verified => true,
          :updated_time => '2011-11-11T06:21:03+0000'
        }
      }
    })
  end

  def twitter_response_for(user, uid)
    OmniAuth::AuthHash.new({
      :provider => "twitter",
      :uid => uid,
      :info => {
        :nickname => user.name,
        :name => user.name,
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
          :name => user.name,
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
  end

  def google_response_for(user, uid, email=user.email)
    OmniAuth::AuthHash.new({
      :provider => "google_oauth2",
      :uid => uid,
      :info => {
        :name => user.name,
        :email => email,
        :first_name => user.name.split(' ').first,
        :last_name => user.name.split(' ').last,
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
          :id => uid,
          :email => email,
          :verified_email => true,
          :name => user.name,
          :given_name => user.name.split(' ').first,
          :family_name => user.name.split(' ').last,
          :link => "https://plus.google.com/123456789",
          :picture => "https://lh3.googleusercontent.com/url/photo.jpg",
          :gender => "male",
          :birthday => "0000-06-25",
          :locale => "en",
          :hd => "company_name.com"
        }
      }
    })
  end


  # e.g. sign_in_with :email => @user.email, :password => 'whatever'
  def sign_in_with(user_details={:email => 'user@example.com', :password => 'password'})
    visit '/'
    click_link 'Login'
    fill_in 'Email', :with => user_details[:email]
    fill_in 'Password', :with => user_details[:password]
    click_button 'Sign in'
  end

end
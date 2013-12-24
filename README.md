Meeting Rooms
=============

An open source project commissioned by TechHub to develop a meeting room booking system.

##Environmental configuration

This app requires the set up of the following environmental variables containing mail server account configuration:
  
  * MAILER_USER_NAME
  * MAILER_PASSWORD
  * MAILER_DOMAIN

This app expects the Devise secret key to be kept in the environment variable:
  * DEVISE_SECRET_KEY

This app requires the set up of the following environmental variables in order for sign in with social network providers to work

  * For sign in with Facebook (ensure the app is recorded as a 'web app' with Facebook in the Advanced settings)
    * `FACEBOOK_ID` - containing the app_id for the app registered with Facebook
    * `FACEBOOK_SECRET` - containing the app_secret for the app registered with Facebook
  * For sign in with Google
    * `GOOGLE_KEY` - containng the Client ID for OAuth2 Google+ api access
    * `GOOGLE_SECRET` - containng the Client Secret for OAuth2 Google+ api access
  * For sign in with Twitter (ensure you enable 'Sign in with Twitter' in your app settings on Twitter)
    * `TWITTER_KEY` - containing the 'Consumer key' for Twitter OAuth access
    * `TWITTER_SECRET` - containing the 'Consumer secret' for Twitter OAuth access


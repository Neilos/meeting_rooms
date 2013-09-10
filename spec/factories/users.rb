FactoryGirl.define do
  factory :user do
    name 'John Smith'
    email 'example@example.com'
    password 'password'
    password_confirmation 'password'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end
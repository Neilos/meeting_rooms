FactoryGirl.define do
  factory :user do
    sequence :name do |n| "User #{n}" end
    sequence :email do |n| "user#{n}@example.com" end
    password 'password'
    password_confirmation 'password'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now

    initialize_with {
      User.where(email: email).first_or_create
    }
  end
end
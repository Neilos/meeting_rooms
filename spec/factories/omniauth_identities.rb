# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :omniauth_identity do
    user_id 1
    provider "Facebook"
    uid "123456"
  end
end

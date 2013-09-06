# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :omniauth_identity do
    user_id 1
    provider "MyString"
    uid "MyString"
  end
end

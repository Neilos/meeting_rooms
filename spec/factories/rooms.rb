# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    name "MyString"
    price_per_hour "9.99"
    location_id 1
    organization_id 1
    people_capacity 1
  end
end

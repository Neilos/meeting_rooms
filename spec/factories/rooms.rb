# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    name "Room 1"
    price_per_hour "9.99"
    location_id 1
    organization_id 1
    people_capacity 1
  end
end

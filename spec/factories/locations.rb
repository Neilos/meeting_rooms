# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    sequence :name do |n| "Site #{n}" end
    sequence :address_line_1 do |n| "#{n} Example Road" end
    address_line_2 "Example Area"
    town_city "Example Town"
    county "Example County"
    postcode "EXA MPLE"
    country "United Kingdom"
    association :organization, factory: :organization

    factory :location_with_rooms do
      ignore do
        rooms_count 5
      end

      after(:create) do |location, evaluator|
        FactoryGirl.create_list(:room, evaluator.rooms_count, location: location, organization: location.organization)
      end
    end
  end
end

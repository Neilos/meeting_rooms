# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name "Site 1"
    address_line_1 "27 Example Road"
    address_line_2 "Example Area"
    town_city "Example Town"
    county "Example County"
    postcode "EXA MPLE"
    country "United Kingdom"
    organization_id 5
  end

  factory :location2, class: Location do
    name "Site 2"
    address_line_1 "56 Example Road"
    address_line_2 "Example Area"
    town_city "Example Town"
    county "Example County"
    postcode "RM9 5YT"
    country "United Kingdom"
    organization_id 5
  end
end

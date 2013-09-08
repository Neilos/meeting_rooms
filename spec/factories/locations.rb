# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name "MyString"
    address_line_1 "MyString"
    address_line_2 "MyString"
    town_city "MyString"
    county "MyString"
    postcode "MyString"
    country "MyString"
  end
end
